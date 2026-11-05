## Overview

[Stripe](https://stripe.com/) is an online payment processing platform for accepting payments, managing customers and subscriptions, issuing invoices and paying out to bank accounts.

The Stripe connector lets Ballerina applications call the [Stripe REST API](https://stripe.com/docs/api) to create and manage payments, customers, subscriptions, invoices, products and prices, refunds and payouts, and the Connect, Billing, Issuing, Terminal and Treasury products. It supports the `2026-09-30.endive` version of the API.

### Key features

- Accept and manage payments with payment intents, charges, refunds and payment methods
- Manage customers, subscriptions, invoices and billing
- Maintain product catalogs, prices, coupons and promotion codes
- Onboard and pay out connected accounts with Stripe Connect
- Cover the full Stripe API surface, including Issuing, Terminal, Treasury, Tax and Radar

## Setup guide

To use the Ballerina Stripe connector, you must have a Stripe account and an API token for authentication. Follow the steps below to set up the connector with your Stripe account. If you don't have an account, you can create one by visiting [Stripe Sign Up page](https://dashboard.stripe.com/register) and completing the registration process.

### Step 1: Log in to Stripe

1. Sign in to your [Stripe dashboard](https://dashboard.stripe.com/login).

### Step 2: Go to the developer portal

1. Click on the **Developers** button in the top-right corner.

    <img src=https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-stripe/main/docs/setup/resources/stripe-dashboard.png alt="Stripe dashboard" style="width: 70%;">   

### Step 3: Retrieve the secret key

1. Go to **API keys** section in the nav-bar.

    <img src=https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-stripe/main/docs/setup/resources/stripe-developer-portal.png alt="Stripe dashboard" style="width: 70%;">   

2. Retrieve the **Secret key**.

    <img src=https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-stripe/main/docs/setup/resources/stripe-api-keys.png alt="Stripe dashboard" style="width: 70%;">   

> **Note:** If you need to have more granular permissions for the keys, you could setup and use `Restricted keys`.

## Quickstart

To use the Stripe connector in your Ballerina application, update the `.bal` file as follows.

### Step 1: Import the connector

Import the `ballerinax/stripe` package into your Ballerina project.

```ballerina
import ballerinax/stripe;
```

### Step 2: Configure the credentials

Create a `Config.toml` file with your Stripe secret key.

```toml
secretKey = "<secret-key>"
```

### Step 3: Instantiate a new connector

Create a `stripe:ConnectionConfig` with the secret key and initialize the client.

```ballerina
configurable string secretKey = ?;

stripe:Client stripe = check new ({auth: {token: secretKey}});
```

### Step 4: Invoke the connector operation

Create a customer.

```ballerina
public function main() returns error? {
    stripe:Customer _ = check stripe->createCustomer({name: "John Doe", email: "john.doe@sample.com"});
}
```

## Examples

The `ballerinax/stripe` connector provides practical examples illustrating usage in various scenarios. Explore these [examples](https://github.com/ballerina-platform/module-ballerinax-stripe/tree/main/examples).

1. [Manage Stripe payments](../examples/manage_payments/manage_payments.md) - Create a customer, take a payment with a payment intent, confirm it and refund it.

2. [Manage one-time charges](../examples/manage_one_time_charges/manage_one_time_charges.md) - Create, retrieve and refund a one-time charge.
