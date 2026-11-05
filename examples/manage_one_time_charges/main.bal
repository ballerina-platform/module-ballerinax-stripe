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

import ballerina/io;
import ballerinax/stripe;

configurable string secretKey = ?;
configurable string sourceToken = ?;

public function main() returns error? {
    stripe:Client stripe = check new ({auth: {token: secretKey}});

    // Initiate a one-time charge
    stripe:Charge charge = check stripe->createCharge({amount: 1000, currency: "usd", 'source: sourceToken});
    io:println("One-time charge created: ", charge.id);

    // Retrieve the charge to confirm its state
    stripe:Charge retrieved = check stripe->getCharge(charge.id);
    io:println("Charge paid: ", retrieved.paid);

    // Refund the charge
    stripe:Refund refund = check stripe->createRefund({charge: charge.id, amount: 1000});
    io:println("Charge refunded: ", refund.id);
}
