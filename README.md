# Ballerina Stripe connector

[![Build](https://github.com/ballerina-platform/module-ballerinax-stripe/actions/workflows/ci.yml/badge.svg)](https://github.com/ballerina-platform/module-ballerinax-stripe/actions/workflows/ci.yml)
[![GitHub Last Commit](https://img.shields.io/github/last-commit/ballerina-platform/module-ballerinax-stripe.svg)](https://github.com/ballerina-platform/module-ballerinax-stripe/commits/main)
[![GitHub Issues](https://img.shields.io/github/issues/ballerina-platform/ballerina-library/module/stripe.svg?label=Open%20Issues)](https://github.com/ballerina-platform/ballerina-library/labels/module%2Fstripe)

## Overview

[Stripe](https://stripe.com/) is an online payment processing platform for accepting payments, managing customers and subscriptions, issuing invoices and paying out to bank accounts.

The Stripe connector lets Ballerina applications call the [Stripe REST API](https://stripe.com/docs/api) to create and manage payments, customers, subscriptions, invoices, products and prices, refunds and payouts, and the Connect, Billing, Issuing, Terminal and Treasury products. It supports the `2026-09-30.endive` version of the API.

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

1. [Manage Stripe payments](examples/manage_payments/manage_payments.md) - Create a customer, take a payment with a payment intent, confirm it and refund it.

2. [Manage one-time charges](examples/manage_one_time_charges/manage_one_time_charges.md) - Create, retrieve and refund a one-time charge.

## Build from the source

### Setting up the prerequisites

1. Download and install Java SE Development Kit (JDK) version 21. You can download it from either of the following sources:

    * [Oracle JDK](https://www.oracle.com/java/technologies/downloads/)
    * [OpenJDK](https://adoptium.net/)

   > **Note:** After installation, remember to set the `JAVA_HOME` environment variable to the directory where JDK was installed.

2. Download and install [Ballerina Swan Lake](https://ballerina.io/).

3. Download and install [Docker](https://www.docker.com/get-started).

   > **Note**: Ensure that the Docker daemon is running before executing any tests.

4. Export Github Personal access token with read package permissions as follows,

    ```bash
    export packageUser=<Username>
    export packagePAT=<Personal access token>
    ```

### Build options

Execute the commands below to build from the source.

1. To build the package:

   ```bash
   ./gradlew clean build
   ```

2. To run the tests:

   ```bash
   ./gradlew clean test
   ```

3. To build the without the tests:

   ```bash
   ./gradlew clean build -x test
   ```

4. To run tests against different environments:

   ```bash
   ./gradlew clean test -Pgroups=<Comma separated groups/test cases>
   ```

5. To debug the package with a remote debugger:

   ```bash
   ./gradlew clean build -Pdebug=<port>
   ```

6. To debug with the Ballerina language:

   ```bash
   ./gradlew clean build -PbalJavaDebug=<port>
   ```

7. Publish the generated artifacts to the local Ballerina Central repository:

    ```bash
    ./gradlew clean build -PpublishToLocalCentral=true
    ```

8. Publish the generated artifacts to the Ballerina Central repository:

   ```bash
   ./gradlew clean build -PpublishToCentral=true
   ```

## Contribute to Ballerina

As an open-source project, Ballerina welcomes contributions from the community.

For more information, go to the [contribution guidelines](https://github.com/ballerina-platform/ballerina-lang/blob/master/CONTRIBUTING.md).

## Code of conduct

All the contributors are encouraged to read the [Ballerina Code of Conduct](https://ballerina.io/code-of-conduct).

## Useful links

* For more information go to the [`stripe` package](https://central.ballerina.io/ballerinax/stripe/latest).
* For example demonstrations of the usage, go to [Ballerina By Examples](https://ballerina.io/learn/by-example/).
* Chat live with us via our [Discord server](https://discord.gg/ballerinalang).
* Post all technical questions on Stack Overflow with the [#ballerina](https://stackoverflow.com/questions/tagged/ballerina) tag.
