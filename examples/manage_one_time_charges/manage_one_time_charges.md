# Manage Stripe one-time charges

This example creates a one-time charge, retrieves it and refunds it.

## Prerequisites

### 1. Setup Stripe account

Refer to the [Setup guide](https://central.ballerina.io/ballerinax/stripe/latest#setup-guide) to set up your Stripe account, if you do not have one.

### 2. Configuration

Create a `Config.toml` file in the example root directory:

```toml
secretKey = "<secret-key>"
sourceToken = "<source-token>"
```

## Run the example

```bash
bal run
```
