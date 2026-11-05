# Manage Stripe payments

This example creates a customer, takes a payment with a payment intent, confirms it and refunds it.

## Prerequisites

### 1. Setup Stripe account

Refer to the [Setup guide](https://central.ballerina.io/ballerinax/stripe/latest#setup-guide) to set up your Stripe account, if you do not have one.

### 2. Configuration

Create a `Config.toml` file in the example root directory:

```toml
secretKey = "<secret-key>"
paymentMethodId = "<payment-method-id>"
returnUrl = "<return-url>"
```

The example confirms the payment and refunds it in one run, so it needs a payment method that succeeds without customer action. In a Stripe sandbox, use the test payment method `pm_card_visa`. A payment method that requires further action, such as 3D Secure, stops the example before the refund.

## Run the example

```bash
bal run
```
