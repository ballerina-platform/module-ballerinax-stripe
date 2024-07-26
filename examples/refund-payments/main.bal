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
    stripe:refunds_body refundDetails = {
        // Update the payment-id here
        payment_intent: "pi_xxxxxx"
    };
    stripe:Refund paymentRefund = check stripe->/refunds.post(refundDetails);

    io:println("Payment refund successful: ", paymentRefund.id);
}
