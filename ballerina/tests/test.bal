// Copyright (c) 2024, WSO2 LLC. (http://www.wso2.com).
//
// WSO2 LLC. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/http;
import ballerina/os;
import ballerina/test;

final boolean isLiveServer = os:getEnv("IS_LIVE_SERVER") == "true";
final string serviceUrl = isLiveServer ? "https://api.stripe.com/v1" : "http://localhost:9090";
final string apiKey = isLiveServer ? os:getEnv("STRIPE_API_KEY") : "sk_test_mock";

final Client stripe = check new ({auth: {token: apiKey}, httpVersion: http:HTTP_1_1}, serviceUrl);

// Account and balance

@test:Config {groups: ["live_tests", "mock_tests"]}
function testGetCurrentAccount() returns error? {
    Account response = check stripe->getCurrentAccount();
    test:assertTrue(response.id != "");
}

@test:Config {groups: ["live_tests", "mock_tests"]}
function testGetBalance() returns error? {
    Balance response = check stripe->getBalance();
    test:assertEquals(response.'object, "balance");
}

// Customers

@test:Config {groups: ["live_tests", "mock_tests"]}
function testCreateCustomer() returns error? {
    Customer response = check stripe->createCustomer({email: "jenny.rosen@example.com", name: "Jenny Rosen"});
    test:assertTrue(response.id != "");
}

@test:Config {groups: ["live_tests", "mock_tests"]}
function testGetCustomer() returns error? {
    Customer created = check stripe->createCustomer({email: "jenny.rosen@example.com"});
    CustomerOrDeletedCustomer response = check stripe->getCustomer(created.id);
    test:assertTrue(response.id != "");
}

@test:Config {groups: ["live_tests", "mock_tests"]}
function testUpdateCustomer() returns error? {
    Customer created = check stripe->createCustomer({email: "jenny.rosen@example.com"});
    Customer response = check stripe->updateCustomer(created.id, {name: "Jenny R."});
    test:assertTrue(response.id != "");
}

@test:Config {groups: ["live_tests", "mock_tests"]}
function testListCustomers() returns error? {
    CustomerResourceCustomerList response = check stripe->listCustomers();
    test:assertEquals(response.'object, "list");
}

@test:Config {groups: ["live_tests", "mock_tests"]}
function testDeleteCustomer() returns error? {
    Customer created = check stripe->createCustomer({email: "delete.me@example.com"});
    DeletedCustomer response = check stripe->deleteCustomer(created.id);
    test:assertTrue(response.deleted);
}

// Payment intents

@test:Config {groups: ["live_tests", "mock_tests"]}
function testCreatePaymentIntent() returns error? {
    PaymentIntent response = check stripe->createPaymentIntent({amount: 2000, currency: "usd"});
    test:assertTrue(response.id != "");
}

@test:Config {groups: ["live_tests", "mock_tests"]}
function testGetPaymentIntent() returns error? {
    PaymentIntent created = check stripe->createPaymentIntent({amount: 2000, currency: "usd"});
    PaymentIntent response = check stripe->getPaymentIntent(created.id);
    test:assertTrue(response.id != "");
}

@test:Config {groups: ["live_tests", "mock_tests"]}
function testListPaymentIntents() returns error? {
    PaymentFlowsPaymentIntentList response = check stripe->listPaymentIntents();
    test:assertEquals(response.'object, "list");
}

@test:Config {groups: ["live_tests", "mock_tests"]}
function testConfirmPaymentIntent() returns error? {
    if isLiveServer {
        return;
    }
    PaymentIntent created = check stripe->createPaymentIntent({amount: 2000, currency: "usd"});
    PaymentIntent response = check stripe->confirmPaymentIntent(created.id, {paymentMethod: "pm_card_visa"});
    test:assertTrue(response.id != "");
}

@test:Config {groups: ["live_tests", "mock_tests"]}
function testCancelPaymentIntent() returns error? {
    PaymentIntent created = check stripe->createPaymentIntent({amount: 2000, currency: "usd"});
    PaymentIntent response = check stripe->cancelPaymentIntent(created.id, {cancellationReason: "duplicate"});
    test:assertTrue(response.id != "");
}

// Charges and refunds

@test:Config {groups: ["live_tests", "mock_tests"]}
function testCreateCharge() returns error? {
    if isLiveServer {
        return;
    }
    Charge response = check stripe->createCharge({amount: 2000, currency: "usd", 'source: "tok_visa"});
    test:assertTrue(response.id != "");
}

@test:Config {groups: ["live_tests", "mock_tests"]}
function testGetCharge() returns error? {
    if isLiveServer {
        return;
    }
    Charge response = check stripe->getCharge("ch_1Pq3Zk2eZvKYlo2C0aBcD123");
    test:assertTrue(response.id != "");
}

@test:Config {groups: ["live_tests", "mock_tests"]}
function testListCharges() returns error? {
    ChargeList response = check stripe->listCharges();
    test:assertEquals(response.'object, "list");
}

@test:Config {groups: ["live_tests", "mock_tests"]}
function testCreateRefund() returns error? {
    if isLiveServer {
        return;
    }
    Refund response = check stripe->createRefund({charge: "ch_1Pq3Zk2eZvKYlo2C0aBcD123"});
    test:assertTrue(response.id != "");
}

@test:Config {groups: ["live_tests", "mock_tests"]}
function testGetRefund() returns error? {
    if isLiveServer {
        return;
    }
    Refund response = check stripe->getRefund("re_1Pq3Zk2eZvKYlo2C0aBcD123");
    test:assertTrue(response.id != "");
}

@test:Config {groups: ["live_tests", "mock_tests"]}
function testListRefunds() returns error? {
    APIMethodRefundList response = check stripe->listRefunds();
    test:assertEquals(response.'object, "list");
}

// Catalog

@test:Config {groups: ["live_tests", "mock_tests"]}
function testCreateProduct() returns error? {
    Product response = check stripe->createProduct({name: "Gold Plan"});
    test:assertTrue(response.id != "");
}

@test:Config {groups: ["live_tests", "mock_tests"]}
function testGetProduct() returns error? {
    Product created = check stripe->createProduct({name: "Gold Plan"});
    Product response = check stripe->getProduct(created.id);
    test:assertTrue(response.id != "");
}

@test:Config {groups: ["live_tests", "mock_tests"]}
function testListProducts() returns error? {
    ProductList response = check stripe->listProducts();
    test:assertEquals(response.'object, "list");
}

@test:Config {groups: ["live_tests", "mock_tests"]}
function testCreatePrice() returns error? {
    Product product = check stripe->createProduct({name: "Silver Plan"});
    Price response = check stripe->createPrice({currency: "usd", unitAmount: 1000, product: product.id});
    test:assertTrue(response.id != "");
}

@test:Config {groups: ["live_tests", "mock_tests"]}
function testGetPrice() returns error? {
    Product product = check stripe->createProduct({name: "Silver Plan"});
    Price created = check stripe->createPrice({currency: "usd", unitAmount: 1000, product: product.id});
    Price response = check stripe->getPrice(created.id);
    test:assertTrue(response.id != "");
}

@test:Config {groups: ["live_tests", "mock_tests"]}
function testCreateCoupon() returns error? {
    Coupon response = check stripe->createCoupon({percentOff: 25, duration: "once"});
    test:assertTrue(response.id != "");
}

@test:Config {groups: ["live_tests", "mock_tests"]}
function testGetCoupon() returns error? {
    Coupon created = check stripe->createCoupon({percentOff: 25, duration: "once"});
    Coupon response = check stripe->getCoupon(created.id);
    test:assertTrue(response.id != "");
}
