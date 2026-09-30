# Running Tests

## Prerequisites

The tests run against a local mock server by default, so no credentials are needed. To run them against the live Stripe API, use a test-mode secret key.

## Test groups

- `mock_tests` - run against the mock service in `tests/mock_service.bal`, which serves 25 operations on port 9090
- `live_tests` - run against `https://api.stripe.com/v1` when `IS_LIVE_SERVER` is `true`

The suite covers account and balance retrieval, customers (create, get, update, list, delete), payment intents (create, get, list, confirm, cancel), charges, refunds, products, prices and coupons.

## Running the tests

Against the mock server:

```bash
bal test --groups mock_tests
```

Against the live API:

```bash
export IS_LIVE_SERVER=true
export STRIPE_API_KEY=<test-mode-secret-key>
bal test --groups live_tests
```

Tests that need a confirmed card payment or an existing charge are skipped when running live.
