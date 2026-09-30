# Sanitation: Ballerina Stripe connector

_Author_: @ayeshLK \
_Created_: 2024/07/18 \
_Updated_: 2026/09/30 \
_Edition_: Swan Lake

## Sanitation for OpenAPI specification

This document records the sanitation done on top of the official OpenAPI specification from Stripe. The OpenAPI specification is obtained from [wso2/api-specs](https://github.com/wso2/api-specs/blob/main/openapi/stripe/stripe/2026-09-30.endive/openapi.json) (Stripe API version `2026-09-30.endive`).
These changes are done to improve the overall usability and to address some known language limitations.

1. Update Stripe Base URL to `https://api.stripe.com/v1` and remove the `/v1` prefix from the paths.
2. Remove the `requestBody` definitions from HTTP GET endpoints (273 operations in the source, each an empty form-encoded object) and from HTTP DELETE endpoints that require no payload. The GET bodies are removed from `docs/spec/openapi.json`; the DELETE bodies are removed from the aligned spec by `docs/spec/fix_aligned.py`, which is idempotent and is re-applied after every alignment.
3. Rename the operations (`operationId`) to intent-revealing camelCase names (for example `createCustomer`, `getPaymentIntent`, `confirmPaymentIntent`) and the request body schemas to `<Operation>Request`. The decisions are persisted in `docs/spec/ai-mappings.json`.
4. Give descriptive names to the generic inline schemas: `InlineResponse200` to `CustomerOrDeletedCustomer`, `InlineResponse2001` to `CustomerSourceUpdateResponse`, `InlineResponse2002` to `CustomerSourceDeleteResponse`, `InlineResponse2003` to `TerminalConfigurationResponse`, `InlineResponse2004` to `TerminalLocationResponse`, `InlineResponse2005` to `TerminalReaderResponse` and `InlineProductParams` to `ProductCreateParams`.
5. Add summaries to the 16 operations that had none, and descriptions to the 339 request bodies.
6. `/v1/account` is exposed as `getCurrentAccount`, and the balance history endpoints as `listBalanceHistory` and `getBalanceHistoryItem`.
7. Document every property and parameter. Stripe leaves many undocumented: bare `$ref` properties (a description beside a `$ref` is dropped in OpenAPI 3.0 tooling, so it never reached the generated record fields) and nested form parameters with no description. `docs/spec/fill_descriptions.py` fills them, idempotently, in the source `openapi.json` and the aligned spec, and wraps each described `$ref` property as `allOf: [{$ref}]` so the description survives. Sources, in order: the referenced schema's description, the single description that every documented property of the same name and type carries (in this spec, then the previous spec), and, as a last resort, a neutral sentence built from the field name and its parent. For the aligned spec this filled 736 properties from the referenced schema, 978 from the same-named property, 32 from the previous spec and 5,433 from the field name, plus 30 parameters from the same-named parameter and 392 from the parameter name. Re-run it after every alignment, before generating the client.

## OpenAPI CLI command

The following command was used to generate the Ballerina client from the OpenAPI specification. The command should be executed from the repository root directory.

```bash
bal openapi -i docs/spec/aligned_ballerina_openapi.json --mode client --license docs/license.txt -o ballerina --client-methods remote
```

Note: The license year is hardcoded to 2024, change if necessary.
