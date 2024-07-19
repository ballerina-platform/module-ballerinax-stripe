# Ballerina Stripe connector

[![Build](https://github.com/ballerina-platform/module-ballerinax-stripe/actions/workflows/ci.yml/badge.svg)](https://github.com/ballerina-platform/module-ballerinax-stripe/actions/workflows/ci.yml)
[![Trivy](https://github.com/ballerina-platform/module-ballerinax-stripe/actions/workflows/trivy-scan.yml/badge.svg)](https://github.com/ballerina-platform/module-ballerinax-stripe/actions/workflows/trivy-scan.yml)
[![GraalVM Check](https://github.com/ballerina-platform/module-ballerinax-stripe/actions/workflows/build-with-bal-test-native.yml/badge.svg)](https://github.com/ballerina-platform/module-ballerinax-stripe/actions/workflows/build-with-bal-test-native.yml)
[![GitHub Last Commit](https://img.shields.io/github/last-commit/ballerina-platform/module-ballerinax-stripe.svg)](https://github.com/ballerina-platform/module-ballerinax-stripe/commits/master)
[![GitHub Issues](https://img.shields.io/github/issues/ballerina-platform/ballerina-library/module/stripe.svg?label=Open%20Issues)](https://github.com/ballerina-platform/ballerina-library/labels/module%stripe)

[Stripe](https://stripe.com/) is a leading online payment processing platform that simplifies the handling of financial transactions over the Internet. Stripe is renowned for its ease of integration, comprehensive documentation, and robust API that supports a wide range of payment operations including credit card transactions, subscription management, and direct payouts to user bank accounts.

The Ballerina Stripe Connector allows developers to interact with the [Stripe REST API](https://stripe.com/docs/api), enabling seamless integration of Stripe’s extensive payment processing capabilities into Ballerina applications. This connector facilitates the automation of various payment-related operations such as charge creation, customer management, billing, and direct payouts. By leveraging the Ballerina Stripe Connector, developers can build secure and scalable payment solutions that enhance the e-commerce capabilities of their applications.

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
stripe:v1_customers_body newCustomer = {
    name: "John Doe",
    email: "john.doe@sample.com",
    address: {
        city: "Colombo",
        country: "Sri Lanka"
    }
};

stripe:Customer customerDetails = check stripe->/v1/customers.post();
```

#### List all customers

```ballerina
stripe:CustomerResourceCustomerList availableCustomers = check stripe->/v1/customers();
```

## Build from the source

### Setting up the prerequisites

1. Download and install Java SE Development Kit (JDK) version 17. You can download it from either of the following sources:

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
