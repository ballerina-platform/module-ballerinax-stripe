// Copyright (c) 2024 WSO2 LLC. (http://www.wso2.com).
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

import ballerina/io;
import ballerinax/stripe;

// Configuration for Stripe API access
configurable string secretKey = ?;

public function main() returns error? {
    stripe:Client stripe = check new ({auth: {token: secretKey}});

    // Initiate a one-time charge
    stripe:charges_body chargeDetails = {
        amount: 100,
        currency: "usd",
        // Update the payment-source token here
        'source: "tok_xxxx"
    };
    stripe:Charge charge = check stripe->/charges.post(chargeDetails);
    io:println("Onetime charge was successful: ", charge.id);

    // Refund a one-time charge
    stripe:charge_refund_body chargeRefund = {
        amount: 100
    };
    charge = check stripe->/charges/[charge.id]/refund.post(chargeRefund);
    io:println("Onetime charge refund was successful: ", charge.id);
}
