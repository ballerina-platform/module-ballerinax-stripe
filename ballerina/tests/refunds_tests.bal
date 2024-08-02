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

isolated string commonRefundId = "";

function setCommonRefundId(string refundId) {
    lock {
        commonRefundId = refundId;
    }
}

function getCommonRefundId() returns string {
    lock {
        return commonRefundId;
    }
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function refundTest() returns error? {
    payment_intents_body paymentDetails = {
        amount: 100,
        currency: "usd"
    };
    Payment_intent payment = check stripe->/payment_intents.post(paymentDetails);

    intent_confirm_body paymentConfirmation = {
        payment_method: "pm_card_visa",
        return_url: "https://www.example.com"
    };
    payment = check stripe->/payment_intents/[payment.id]/confirm.post(paymentConfirmation);

    refunds_body refundDetails = {
        payment_intent: payment.id
    };
    Refund paymentRefund = check stripe->/refunds.post(refundDetails);
    test:assertEquals(paymentRefund.amount, 100, "Invalid refund amount");
    setCommonRefundId(paymentRefund.id);
}

@test:Config {
    groups: ["live_tests", "mock_tests"],
    dependsOn: [refundTest]
}
function refundUpdateTest() returns error? {
    string refundId = getCommonRefundId();
    record {|string...;|} metadata = {
        "orderId": "1234"
    };
    refunds_refund_body_1 refundUpate = { metadata };
    Refund paymentRefund = check stripe->/refunds/[refundId].post(refundUpate);
    test:assertEquals(paymentRefund?.metadata, metadata, "Invalid meta-data found");     
}
