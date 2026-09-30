"""Idempotent fixes re-applied to the aligned spec (keyed on path+method)."""
import json, sys
f = sys.argv[1] if len(sys.argv) > 1 else 'docs/spec/aligned_ballerina_openapi.json'
d = json.load(open(f))
d['servers'] = [{'url': 'https://api.stripe.com/v1'}]
for p, pi in d['paths'].items():
    for m, o in pi.items():
        if m in ('get', 'head', 'delete') and 'requestBody' in o:
            s = list(o['requestBody'].get('content', {}).values())[0].get('schema', {})
            if not s.get('properties') and '$ref' not in s:
                del o['requestBody']
json.dump(d, open(f, 'w'), indent=2, ensure_ascii=False)
