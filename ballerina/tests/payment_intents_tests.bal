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

import ballerina/test;

isolated string commonPaymentIntentId = "";

function setCommonPaymentIntentId(string paymentIntentId) {
    lock {
        commonPaymentIntentId = paymentIntentId;
    }
}

function getCommonPaymentIntentId() returns string {
    lock {
        return commonPaymentIntentId;
    }
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function createPaymentIntentTest() returns error? {
    payment_intents_body paymentDetails = {
        amount: 100,
        currency: "usd"
    };
    Payment_intent payment = check stripe->/payment_intents.post(paymentDetails);
    test:assertEquals(payment.amount, 100, "Invalid payment amount");
    setCommonPaymentIntentId(payment.id);   
}

@test:Config {
    groups: ["live_tests", "mock_tests"],
    dependsOn: [createPaymentIntentTest]
}
function updatePaymentIntentTest() returns error? {
    string paymentId = getCommonPaymentIntentId();
    record {|string...;|} metadata = {
        "orderId": "1234"
    };
    payment_intents_intent_body paymentUpdate = { metadata };
    Payment_intent payment = check stripe->/payment_intents/[paymentId].post(paymentUpdate);
    test:assertEquals(payment.metadata, metadata, "Invalid meta-data found"); 
}

@test:Config {
    groups: ["live_tests", "mock_tests"],
    dependsOn: [createPaymentIntentTest]
}
function confirmPaymentIntentTest() returns error? {
    string paymentId = getCommonPaymentIntentId();
    intent_confirm_body paymentConfirmation = {
        payment_method: "pm_card_visa",
        return_url: "https://www.example.com"
    };
    Payment_intent payment = check stripe->/payment_intents/[paymentId]/confirm.post(paymentConfirmation);
    test:assertEquals(payment.status, "succeeded", "Payment confirmation failed");
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function cancelPaymentTest() returns error? {
    payment_intents_body paymentDetails = {
        amount: 100,
        currency: "usd"
    };
    Payment_intent payment = check stripe->/payment_intents.post(paymentDetails);

    intent_cancel_body paymentCancellation = {
        cancellation_reason: "requested_by_customer"
    };
    Payment_intent cancelledPayment = check stripe->/payment_intents/[payment.id]/cancel.post(paymentCancellation);
    test:assertEquals(cancelledPayment.status, "canceled", "Payment cancellation failed");
}
