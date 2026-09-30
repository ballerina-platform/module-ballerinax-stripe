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
configurable string paymentMethodId = ?;
configurable string returnUrl = ?;

public function main() returns error? {
    stripe:Client stripe = check new ({auth: {token: secretKey}});

    // Create a customer to attach the payment to
    stripe:Customer customer = check stripe->createCustomer({name: "Jenny Rosen", email: "jenny.rosen@stripe-sandbox.test"});
    io:println("Customer created: ", customer.id);

    // Create a payment intent for the customer
    stripe:PaymentIntent intent = check stripe->createPaymentIntent({amount: 2000, currency: "usd", customer: customer.id});
    io:println("Payment intent created: ", intent.id);

    // Confirm the payment intent with the configured payment method
    intent = check stripe->confirmPaymentIntent(intent.id, {paymentMethod: paymentMethodId, returnUrl});
    io:println("Payment intent status: ", intent.status);

    // Only a succeeded payment can be refunded
    if intent.status != "succeeded" {
        io:println("Payment not completed. Action required: ", intent.status);
        return;
    }

    // Refund the confirmed payment
    stripe:Refund refund = check stripe->createRefund({paymentIntent: intent.id});
    io:println("Refund created: ", refund.id);
}
