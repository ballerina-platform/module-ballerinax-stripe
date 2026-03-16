## Overview

[Stripe](https://stripe.com/) is an online payment processing platform that simplifies the handling of financial transactions over the internet. It supports a wide range of payment operations including credit card transactions, subscription management, and direct payouts.

The Stripe connector allows developers to interact with the Stripe REST API V1, enabling seamless integration of Stripe’s extensive payment processing capabilities. This connector facilitates the automation of various payment-related operations such as charge creation, customer management, billing, and payouts.

### Key Features

- Support for Stripe REST API V1
- Comprehensive payment processing (charges, refunds, payouts)
- Efficient customer and subscription management
- Automated billing and invoicing workflows
- Secure handling of financial transactions

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

To begin using the `Stripe` connector in your Ballerina application, you'll need to follow these steps:

### Step 1: Import the connector

First, import the `ballerinax/stripe` package into your Ballerina project.

```ballerina
import ballerinax/stripe;
```

### Step 2: Instantiate a new connector

Create a `stripe:ConnectionConfig` object with API token, and initialize the connector.

```ballerina
configurable string secretKey = ?;

stripe:ConnectionConfig configuration = {
    auth: {
        token: secretKey
    }
};

stripe:Client stripe = check new (configuration);
```

### Step 3: Invoke the connector operation

Now, utilize the available connector operations.

#### Create a new customer

```ballerina
stripe:customers_body newCustomer = {
    name: "John Doe",
    email: "john.doe@sample.com",
    address: {
        city: "Colombo",
        country: "Sri Lanka"
    }
};

stripe:Customer customerDetails = check stripe->/customers.post(newCustomer);
```

#### List all customers

```ballerina
stripe:CustomerResourceCustomerList availableCustomers = check stripe->/customers;
```

## Examples

The `ballerinax/stripe` connector provides practical examples illustrating usage in various scenarios. Explore these [examples](https://github.com/ballerina-platform/module-ballerinax-stripe/tree/main/examples), covering various Stripe functionalities.

1. [Manage Stripe payments](https://github.com/ballerina-platform/module-ballerinax-stripe/tree/main/examples/manage-payments) - Manage business payments with Stripe.

2. [Manage one-time charges](https://github.com/ballerina-platform/module-ballerinax-stripe/tree/main/examples/manage-one-time-charges) - Manage one-time charges with Stripe.
