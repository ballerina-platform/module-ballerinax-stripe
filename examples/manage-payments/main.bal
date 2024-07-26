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

    // Create a payment intent
    stripe:payment_intents_body paymentDetails = {
        amount: 100,
        currency: "usd"
    };
    stripe:Payment_intent payment = check stripe->/payment_intents.post(paymentDetails);

    // Confirm the payment
    stripe:intent_confirm_body confirmation = {
        // Update the payment method here
        payment_method: "pm_xxxxxx",
        return_url: "https://www.example.com"
    };
    payment = check stripe->/payment_intents/[payment.id]/confirm.post(confirmation);
    io:println("Payment confirmed successfully: ", payment.id);

    // Refund a confirmed payment
    stripe:refunds_body refundDetails = {
        // Update the payment-id here
        payment_intent: payment.id
    };
    stripe:Refund paymentRefund = check stripe->/refunds.post(refundDetails);
    io:println("Payment refund successful: ", paymentRefund.id);
}
