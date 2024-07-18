_Author_: @ayeshLK \
_Created_: 2024/07/18 \
_Edition_: Swan Lake

# Sanitation for OpenAPI specification

This document records the sanitation done on top of the official OpenAPI specification from Stripe. The OpenAPI specification is obtained from the [Stripe GitHub repository](https://github.com/stripe/openapi/blob/master/openapi/spec3.json).
These changes are done to improve the overall usability and to address some known language limitations.

The following sanitations are done using `sanitations.bal` script under the `docs/spec` directory.

1. Remove `requestBody` definitions from HTTP GET endpoints defined in the specification.
2. Update the component schema names by capitalizing the first letter of the schema name.

## OpenAPI cli command

The following command was used to generate the Ballerina client from the OpenAPI specification. The command should be executed from the repository root directory.

```bash
bal openapi -i docs/spec/openapi.json --mode client --license docs/license.txt -o ballerina/
```

Note: The license year is hardcoded to 2024, change if necessary.