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

isolated string commonChargeId = "";

function setCommonChargeId(string chargeId) {
    lock {
        commonChargeId = chargeId;
    }
}

function getCommonChargeId() returns string {
    lock {
        return commonChargeId;
    }
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function createChargeTest() returns error? {
    charges_body chargeDetails = {
        amount: 100,
        currency: "usd",
        'source: "tok_visa"
    };
    Charge charge = check stripe->/charges.post(chargeDetails);
    test:assertEquals(charge.amount, 100, "Invalid charge amount");
    setCommonChargeId(charge.id);
}

@test:Config {
    groups: ["live_tests", "mock_tests"],
    dependsOn: [createChargeTest]
}
function getChargeTest() returns error? {
    string chargeId = getCommonChargeId();
    Charge charge = check stripe->/charges/[chargeId];
    test:assertEquals(charge.id, chargeId, "Invalid charge details found");
}

@test:Config {
    groups: ["live_tests", "mock_tests"],
    dependsOn: [createChargeTest]
}
function updateChargeTest() returns error? {
    string chargeId = getCommonChargeId();
    record {|string...;|} metadata = {
        "shipping": "express"
    };
    charges_charge_body chargeUpdate = { metadata };
    Charge charge = check stripe->/charges/[chargeId].post(chargeUpdate);
    test:assertEquals(charge.metadata, metadata, "Invalid meta-data found");
}

@test:Config {
    groups: ["live_tests", "mock_tests"],
    dependsOn: [updateChargeTest]
}
function refundChargeTest() returns error? {
    string chargeId = getCommonChargeId();
    charge_refund_body chargeRefund = {
        amount: 100
    };
    Charge charge = check stripe->/charges/[chargeId]/refund.post(chargeRefund);
    test:assertTrue(charge.refunded, "Charge refund was unsuccessful");
}
