#!/usr/bin/env python3
"""Fill missing property descriptions in a spec (source or aligned). Idempotent.

Stripe leaves many properties undocumented: bare `$ref` properties (a description beside a
`$ref` is dropped in OpenAPI 3.0, and Stripe does not write one), and nested form parameters.
Each gap is filled from, in order:
  ref   - the description of the schema the property references
  same  - the identical description every documented property of that name and type carries
          (in this spec, or in the previous spec when given via --previous)
  name  - last resort: the humanised field name and its parent, no added semantics

    python3 fill_descriptions.py <spec.json> [--previous old.json] [--report report.json]
"""
import argparse, collections, json, re, sys

def human(n):
    n = re.sub(r'([a-z0-9])([A-Z])', r'\1 \2', n).replace('_', ' ').replace('-', ' ').strip()
    return n.lower()

def props_of(node, parent, out):
    """Yield (container_dict, name, prop, parent_label) for every property, at any depth."""
    if isinstance(node, dict):
        pr = node.get('properties')
        if isinstance(pr, dict):
            for n, p in pr.items():
                if isinstance(p, dict):
                    out.append((pr, n, p, parent))
                    props_of(p, n, out)
        for k, v in node.items():
            if k == 'properties':
                continue
            props_of(v, parent, out)
    elif isinstance(node, list):
        for v in node:
            props_of(v, parent, out)

def ref_target(p, schemas):
    refs = []
    for m in [p] + p.get('allOf', []) + p.get('anyOf', []) + p.get('oneOf', []):
        if isinstance(m, dict) and '$ref' in m:
            refs.append(m['$ref'].split('/')[-1])
    if len(refs) == 1:
        return schemas.get(refs[0], {}).get('description')
    return None

def collect(spec, pool):
    out = []
    props_of(spec, '', out)
    for _, n, p, _ in out:
        if p.get('description') and p.get('type'):
            pool[(n, p['type'])].add(p['description'])

def fill(spec, previous=None):
    schemas = spec.get('components', {}).get('schemas', {})
    pool = collections.defaultdict(set)
    collect(spec, pool)
    old_pool = collections.defaultdict(set)
    if previous:
        collect(previous, old_pool)
    out = []
    # parent label for top-level schema properties is the schema name
    for sn, s in schemas.items():
        pr = []
        props_of(s, sn, pr)
        # props_of labels nested by property name; top level by schema name
        out.extend(pr)
    # inline (non-component) schemas, e.g. request bodies in a source spec
    props_of(spec.get('paths', {}), '', out)
    counts = collections.Counter()
    for container, n, p, parent in out:
        if p.get('description'):
            continue
        # some x-ballerina-name aware naming: use the wire name n
        d = ref_target(p, schemas)
        src = 'ref'
        if not d:
            src = 'same'
            cands = pool.get((n, p.get('type')), set()) if p.get('type') else set()
            if len(cands) == 1:
                d = next(iter(cands))
            else:
                oc = old_pool.get((n, p.get('type')), set()) if p.get('type') else set()
                if not cands and len(oc) == 1:
                    d = next(iter(oc)); src = 'previous'
        if not d:
            src = 'name'
            d = f"The {human(n)} of the {human(parent)}." if parent else f"The {human(n)}."
        if len(d) > 1 and not d.endswith(('.', ')', '`')) and src == 'ref':
            pass
        p['description'] = d
        counts[src] += 1
    # A description beside a bare `$ref` is dropped by OpenAPI 3.0 tooling: wrap the ref.
    for container, n, p, parent in out:
        if '$ref' in p and len(p) > 1:
            p['allOf'] = [{'$ref': p.pop('$ref')}]
            counts['wrapped_ref'] += 1
    # operation / path-item parameters
    params = []
    for pi in spec.get('paths', {}).values():
        for k, o in pi.items():
            if k == 'parameters':
                params += [x for x in o if isinstance(x, dict)]
            elif isinstance(o, dict):
                params += [x for x in o.get('parameters', []) if isinstance(x, dict)]
    ppool = collections.defaultdict(set)
    for x in params:
        if x.get('description'):
            ppool[(x.get('name'), x.get('in'))].add(x['description'])
    for x in params:
        if x.get('description') or '$ref' in x:
            continue
        c = ppool.get((x.get('name'), x.get('in')), set())
        if len(c) == 1:
            x['description'] = next(iter(c)); counts['param_same'] += 1
        else:
            x['description'] = f"The {human(x.get('name', ''))} parameter."
            counts['param_name'] += 1
    return counts

if __name__ == '__main__':
    ap = argparse.ArgumentParser()
    ap.add_argument('spec'); ap.add_argument('--previous')
    a = ap.parse_args()
    spec = json.load(open(a.spec))
    prev = json.load(open(a.previous)) if a.previous else None
    c = fill(spec, prev)
    json.dump(spec, open(a.spec, 'w'), indent=2, ensure_ascii=False)
    print(json.dumps(c))
