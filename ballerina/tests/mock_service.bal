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

listener http:Listener ep0 = new (9090);

service / on ep0 {
    # Delete a customer
    #
    # + return - returns can be any of following types 
    # http:Ok (Successful response)
    # http:DefaultStatusCodeResponse (Error response.)
    resource function delete customers/[string customer]() returns DeletedCustomer|ErrorDefault {
        return <DeletedCustomer>{deleted: true, id: "delete_1Pq3Zk2eZvKYlo2C0aBcD123", 'object: "customer"};
    }

    # Retrieve account
    #
    # + expand - Specifies which fields in the response should be expanded
    # + return - returns can be any of following types 
    # http:Ok (Successful response)
    # http:DefaultStatusCodeResponse (Error response.)
    resource function get account(string[]? expand) returns Account|ErrorDefault {
        return <Account>{created: 1727700000, id: "acct_1Pq3Zk2eZvKYlo2C0aBcD123", 'object: "account"};
    }

    # Retrieve balance
    #
    # + expand - Specifies which fields in the response should be expanded
    # + return - returns can be any of following types 
    # http:Ok (Successful response)
    # http:DefaultStatusCodeResponse (Error response.)
    resource function get balance(string[]? expand) returns Balance|ErrorDefault {
        return <Balance>{livemode: false, pending: [<BalanceAmount>{amount: 2000, currency: "usd"}], available: [<BalanceAmount>{amount: 2000, currency: "usd"}], 'object: "balance"};
    }

    # List all charges
    #
    # + created - Only return charges that were created during the given date interval
    # + customer - Only return charges for the customer specified by this customer ID
    # + endingBefore - A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list
    # + expand - Specifies which fields in the response should be expanded
    # + 'limit - A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10
    # + paymentIntent - Only return charges that were created by the PaymentIntent specified by this PaymentIntent ID
    # + startingAfter - A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list
    # + transferGroup - Only return charges for this transfer group, limited to 100
    # + return - returns can be any of following types 
    # http:Ok (Successful response)
    # http:DefaultStatusCodeResponse (Error response.)
    resource function get charges(string? created, string? customer, @http:Query {name: "ending_before"} string? endingBefore, string[]? expand, int? 'limit, @http:Query {name: "payment_intent"} string? paymentIntent, @http:Query {name: "starting_after"} string? startingAfter, @http:Query {name: "transfer_group"} string? transferGroup) returns ChargeList|ErrorDefault {
        return <ChargeList>{data: [<Charge>{billingDetails: <BillingDetails>{}, metadata: {}, livemode: false, amountRefunded: 1, captured: false, currency: "usd", refunded: false, id: "ch_1Pq3Zk2eZvKYlo2C0aBcD123", amount: 2000, disputed: false, created: 1727700000, amountCaptured: 1, paid: false, 'object: "charge", status: "failed"}], hasMore: false, url: "/v1/charges", 'object: "list"};
    }

    # Retrieve a charge
    #
    # + expand - Specifies which fields in the response should be expanded
    # + return - returns can be any of following types 
    # http:Ok (Successful response)
    # http:DefaultStatusCodeResponse (Error response.)
    resource function get charges/[string charge](string[]? expand) returns Charge|ErrorDefault {
        return <Charge>{billingDetails: <BillingDetails>{}, metadata: {}, livemode: false, amountRefunded: 1, captured: false, currency: "usd", refunded: false, id: "ch_1Pq3Zk2eZvKYlo2C0aBcD123", amount: 2000, disputed: false, created: 1727700000, amountCaptured: 1, paid: false, 'object: "charge", status: "failed"};
    }

    # Retrieve a coupon
    #
    # + expand - Specifies which fields in the response should be expanded
    # + return - returns can be any of following types 
    # http:Ok (Successful response)
    # http:DefaultStatusCodeResponse (Error response.)
    resource function get coupons/[string coupon](string[]? expand) returns Coupon|ErrorDefault {
        return <Coupon>{livemode: false, created: 1727700000, timesRedeemed: 1, duration: "forever", valid: false, id: "coupon_1Pq3Zk2eZvKYlo2C0aBcD123", 'object: "coupon"};
    }

    # List all customers
    #
    # + created - Only return customers that were created during the given date interval
    # + email - A case-sensitive filter on the list based on the customer's `email` field. The value must be a string
    # + endingBefore - A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list
    # + expand - Specifies which fields in the response should be expanded
    # + 'limit - A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10
    # + startingAfter - A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list
    # + testClock - Provides a list of customers that are associated with the specified test clock. The response will not include customers with test clocks if this parameter is not set
    # + return - returns can be any of following types 
    # http:Ok (Successful response)
    # http:DefaultStatusCodeResponse (Error response.)
    resource function get customers(string? created, string? email, @http:Query {name: "ending_before"} string? endingBefore, string[]? expand, int? 'limit, @http:Query {name: "starting_after"} string? startingAfter, @http:Query {name: "test_clock"} string? testClock) returns CustomerResourceCustomerList|ErrorDefault {
        return <CustomerResourceCustomerList>{data: [<Customer>{livemode: false, id: "cus_1Pq3Zk2eZvKYlo2C0aBcD123", created: 1727700000, 'object: "customer"}], hasMore: false, url: "/v1/customers", 'object: "list"};
    }

    # Retrieve a customer
    #
    # + expand - Specifies which fields in the response should be expanded
    # + return - returns can be any of following types 
    # http:Ok (Successful response)
    # http:DefaultStatusCodeResponse (Error response.)
    resource function get customers/[string customer](string[]? expand) returns CustomerOrDeletedCustomer|ErrorDefault {
        return <Customer>{livemode: false, id: "cus_1Pq3Zk2eZvKYlo2C0aBcD123", created: 1727700000, 'object: "customer"};
    }

    # List all PaymentIntents
    #
    # + created - A filter on the list, based on the object `created` field. The value can be a string with an integer Unix timestamp or a dictionary with a number of different query options
    # + customer - Only return PaymentIntents for the customer that this customer ID specifies
    # + customerAccount - Only return PaymentIntents for the account representing the customer that this ID specifies
    # + endingBefore - A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list
    # + expand - Specifies which fields in the response should be expanded
    # + 'limit - A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10
    # + startingAfter - A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list
    # + return - returns can be any of following types 
    # http:Ok (Successful response)
    # http:DefaultStatusCodeResponse (Error response.)
    resource function get payment_intents(string? created, string? customer, @http:Query {name: "customer_account"} string? customerAccount, @http:Query {name: "ending_before"} string? endingBefore, string[]? expand, int? 'limit, @http:Query {name: "starting_after"} string? startingAfter) returns PaymentFlowsPaymentIntentList|ErrorDefault {
        return <PaymentFlowsPaymentIntentList>{data: [<PaymentIntent>{livemode: false, currency: "usd", id: "pi_1Pq3Zk2eZvKYlo2C0aBcD123", amount: 2000, created: 1727700000, 'object: "payment_intent", status: "canceled"}], hasMore: false, url: "/v1/payment_intents", 'object: "list"};
    }

    # Retrieve a PaymentIntent
    #
    # + clientSecret - The client secret of the PaymentIntent. We require it if you use a publishable key to retrieve the source
    # + expand - Specifies which fields in the response should be expanded
    # + return - returns can be any of following types 
    # http:Ok (Successful response)
    # http:DefaultStatusCodeResponse (Error response.)
    resource function get payment_intents/[string intent](@http:Query {name: "client_secret"} string? clientSecret, string[]? expand) returns PaymentIntent|ErrorDefault {
        return <PaymentIntent>{livemode: false, currency: "usd", id: "pi_1Pq3Zk2eZvKYlo2C0aBcD123", amount: 2000, created: 1727700000, 'object: "payment_intent", status: "canceled"};
    }

    # Retrieve a price
    #
    # + expand - Specifies which fields in the response should be expanded
    # + return - returns can be any of following types 
    # http:Ok (Successful response)
    # http:DefaultStatusCodeResponse (Error response.)
    resource function get prices/[string price](string[]? expand) returns Price|ErrorDefault {
        return <Price>{metadata: {}, product: "example", livemode: false, created: 1727700000, active: false, billingScheme: "per_unit", 'type: "one_time", currency: "usd", id: "price_1Pq3Zk2eZvKYlo2C0aBcD123", 'object: "price"};
    }

    # List all products
    #
    # + active - Only return products that are active or inactive (e.g., pass `false` to list all inactive products)
    # + created - Only return products that were created during the given date interval
    # + endingBefore - A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list
    # + expand - Specifies which fields in the response should be expanded
    # + ids - Only return products with the given IDs. Cannot be used with [starting_after](https://docs.stripe.com/api#list_products-starting_after) or [ending_before](https://docs.stripe.com/api#list_products-ending_before)
    # + 'limit - A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10
    # + shippable - Only return products that can be shipped (i.e., physical, not digital products)
    # + startingAfter - A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list
    # + url - Only return products with the given url
    # + return - returns can be any of following types 
    # http:Ok (Successful response)
    # http:DefaultStatusCodeResponse (Error response.)
    resource function get products(boolean? active, string? created, @http:Query {name: "ending_before"} string? endingBefore, string[]? expand, string[]? ids, int? 'limit, boolean? shippable, @http:Query {name: "starting_after"} string? startingAfter, string? url) returns ProductList|ErrorDefault {
        return <ProductList>{data: [<Product>{images: ["example"], metadata: {}, livemode: false, created: 1727700000, active: false, marketingFeatures: [<ProductMarketingFeature>{}], name: "Jenny Rosen", id: "prod_1Pq3Zk2eZvKYlo2C0aBcD123", updated: 1, 'object: "product"}], hasMore: false, url: "/v1/products", 'object: "list"};
    }

    # Retrieve a product
    #
    # + expand - Specifies which fields in the response should be expanded
    # + return - returns can be any of following types 
    # http:Ok (Successful response)
    # http:DefaultStatusCodeResponse (Error response.)
    resource function get products/[string id](string[]? expand) returns Product|ErrorDefault {
        return <Product>{images: ["example"], metadata: {}, livemode: false, created: 1727700000, active: false, marketingFeatures: [<ProductMarketingFeature>{name: "Jenny Rosen"}], name: "Jenny Rosen", id: "prod_1Pq3Zk2eZvKYlo2C0aBcD123", updated: 1, 'object: "product"};
    }

    # List all refunds
    #
    # + charge - Only return refunds for the charge specified by this charge ID
    # + created - Only return refunds that were created during the given date interval
    # + endingBefore - A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list
    # + expand - Specifies which fields in the response should be expanded
    # + 'limit - A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10
    # + paymentIntent - Only return refunds for the PaymentIntent specified by this ID
    # + startingAfter - A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list
    # + return - returns can be any of following types 
    # http:Ok (Successful response)
    # http:DefaultStatusCodeResponse (Error response.)
    resource function get refunds(string? charge, string? created, @http:Query {name: "ending_before"} string? endingBefore, string[]? expand, int? 'limit, @http:Query {name: "payment_intent"} string? paymentIntent, @http:Query {name: "starting_after"} string? startingAfter) returns APIMethodRefundList|ErrorDefault {
        return <APIMethodRefundList>{data: [<Refund>{description: "Sample description", currency: "usd", id: "re_1Pq3Zk2eZvKYlo2C0aBcD123", amount: 2000, created: 1727700000, 'object: "refund"}], hasMore: false, url: "/v1/refunds", 'object: "list"};
    }

    # Retrieve a refund
    #
    # + expand - Specifies which fields in the response should be expanded
    # + return - returns can be any of following types 
    # http:Ok (Successful response)
    # http:DefaultStatusCodeResponse (Error response.)
    resource function get refunds/[string refund](string[]? expand) returns Refund|ErrorDefault {
        return <Refund>{description: "Sample description", currency: "usd", id: "re_1Pq3Zk2eZvKYlo2C0aBcD123", amount: 2000, created: 1727700000, 'object: "refund"};
    }

    # Create a charge
    #
    # + payload - Request payload to create a charge 
    # + return - returns can be any of following types 
    # http:Ok (Successful response)
    # http:DefaultStatusCodeResponse (Error response.)
    resource function post charges(@http:Payload map<string> payload) returns ChargeOk|ErrorDefault {
        return <ChargeOk>{body: <Charge>{billingDetails: <BillingDetails>{}, metadata: {}, livemode: false, amountRefunded: 1, captured: false, currency: "usd", refunded: false, id: "ch_1Pq3Zk2eZvKYlo2C0aBcD123", amount: 2000, disputed: false, created: 1727700000, amountCaptured: 1, paid: false, 'object: "charge", status: "failed"}};
    }

    # Create a coupon
    #
    # + payload - Request payload to create a coupon 
    # + return - returns can be any of following types 
    # http:Ok (Successful response)
    # http:DefaultStatusCodeResponse (Error response.)
    resource function post coupons(@http:Payload map<string> payload) returns CouponOk|ErrorDefault {
        return <CouponOk>{body: <Coupon>{livemode: false, created: 1727700000, timesRedeemed: 1, duration: "forever", valid: false, id: "coupon_1Pq3Zk2eZvKYlo2C0aBcD123", 'object: "coupon"}};
    }

    # Create a customer
    #
    # + payload - Request payload to create a customer 
    # + return - returns can be any of following types 
    # http:Ok (Successful response)
    # http:DefaultStatusCodeResponse (Error response.)
    resource function post customers(@http:Payload map<string> payload) returns CustomerOk|ErrorDefault {
        return <CustomerOk>{body: <Customer>{livemode: false, id: "cus_1Pq3Zk2eZvKYlo2C0aBcD123", created: 1727700000, 'object: "customer"}};
    }

    # Update a customer
    #
    # + payload - Request payload to update a customer 
    # + return - returns can be any of following types 
    # http:Ok (Successful response)
    # http:DefaultStatusCodeResponse (Error response.)
    resource function post customers/[string customer](@http:Payload map<string> payload) returns CustomerOk|ErrorDefault {
        return <CustomerOk>{body: <Customer>{livemode: false, id: "cus_1Pq3Zk2eZvKYlo2C0aBcD123", created: 1727700000, 'object: "customer"}};
    }

    # Create a PaymentIntent
    #
    # + payload - Request payload to create a PaymentIntent 
    # + return - returns can be any of following types 
    # http:Ok (Successful response)
    # http:DefaultStatusCodeResponse (Error response.)
    resource function post payment_intents(@http:Payload map<string> payload) returns PaymentIntentOk|ErrorDefault {
        return <PaymentIntentOk>{body: <PaymentIntent>{livemode: false, currency: "usd", id: "pi_1Pq3Zk2eZvKYlo2C0aBcD123", amount: 2000, created: 1727700000, 'object: "payment_intent", status: "canceled"}};
    }

    # Cancel a PaymentIntent
    #
    # + payload - Request payload to cancel a PaymentIntent 
    # + return - returns can be any of following types 
    # http:Ok (Successful response)
    # http:DefaultStatusCodeResponse (Error response.)
    resource function post payment_intents/[string intent]/cancel(@http:Payload map<string> payload) returns PaymentIntentOk|ErrorDefault {
        return <PaymentIntentOk>{body: <PaymentIntent>{livemode: false, currency: "usd", id: "pi_1Pq3Zk2eZvKYlo2C0aBcD123", amount: 2000, created: 1727700000, 'object: "payment_intent", status: "canceled"}};
    }

    # Confirm a PaymentIntent
    #
    # + payload - Request payload to confirm a PaymentIntent 
    # + return - returns can be any of following types 
    # http:Ok (Successful response)
    # http:DefaultStatusCodeResponse (Error response.)
    resource function post payment_intents/[string intent]/confirm(@http:Payload map<string> payload) returns PaymentIntentOk|ErrorDefault {
        return <PaymentIntentOk>{body: <PaymentIntent>{livemode: false, currency: "usd", id: "pi_1Pq3Zk2eZvKYlo2C0aBcD123", amount: 2000, created: 1727700000, 'object: "payment_intent", status: "canceled"}};
    }

    # Create a price
    #
    # + payload - Request payload to create a price 
    # + return - returns can be any of following types 
    # http:Ok (Successful response)
    # http:DefaultStatusCodeResponse (Error response.)
    resource function post prices(@http:Payload map<string> payload) returns PriceOk|ErrorDefault {
        return <PriceOk>{body: <Price>{metadata: {}, product: "example", livemode: false, created: 1727700000, active: false, billingScheme: "per_unit", 'type: "one_time", currency: "usd", id: "price_1Pq3Zk2eZvKYlo2C0aBcD123", 'object: "price"}};
    }

    # Create a product
    #
    # + payload - Request payload to create a product 
    # + return - returns can be any of following types 
    # http:Ok (Successful response)
    # http:DefaultStatusCodeResponse (Error response.)
    resource function post products(@http:Payload map<string> payload) returns ProductOk|ErrorDefault {
        return <ProductOk>{body: <Product>{images: ["example"], metadata: {}, livemode: false, created: 1727700000, active: false, marketingFeatures: [<ProductMarketingFeature>{name: "Jenny Rosen"}], name: "Jenny Rosen", id: "prod_1Pq3Zk2eZvKYlo2C0aBcD123", updated: 1, 'object: "product"}};
    }

    # Create a refund
    #
    # + payload - Request payload to create a refund 
    # + return - returns can be any of following types 
    # http:Ok (Successful response)
    # http:DefaultStatusCodeResponse (Error response.)
    resource function post refunds(@http:Payload map<string> payload) returns RefundOk|ErrorDefault {
        return <RefundOk>{body: <Refund>{description: "Sample description", currency: "usd", id: "re_1Pq3Zk2eZvKYlo2C0aBcD123", amount: 2000, created: 1727700000, 'object: "refund"}};
    }
}

// Service-mode response types. `bal openapi --mode client` collapses 4XX/5XX
// to `error` and never emits these, so they are defined here for the mock only.
public type ChargeOk record {|
    *http:Ok;
    Charge body;
|};

public type CouponOk record {|
    *http:Ok;
    Coupon body;
|};

public type CustomerOk record {|
    *http:Ok;
    Customer body;
|};

public type ErrorDefault record {|
    *http:DefaultStatusCodeResponse;
    Error body;
|};

public type PaymentIntentOk record {|
    *http:Ok;
    PaymentIntent body;
|};

public type PriceOk record {|
    *http:Ok;
    Price body;
|};

public type ProductOk record {|
    *http:Ok;
    Product body;
|};

public type RefundOk record {|
    *http:Ok;
    Refund body;
|};

# An error response from the Stripe API
public type Error record {
    # Details of the error
    ApiErrors 'error;
};
