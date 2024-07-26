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

isolated string commonCustomerId = "";

function setCommonCustomerId(string customerId) {
    lock {
        commonCustomerId = customerId;
    }
}

function getCommonCustomerId() returns string {
    lock {
        return commonCustomerId;
    }
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function createCustomerTest() returns error? {
    customers_body newCustomer = {
        name: "John Doe",
        email: "john.doe@sample.com",
        address: {
            city: "Colombo",
            country: "Sri Lanka"
        }
    };
    Customer customer = check stripe->/customers.post(newCustomer);
    test:assertEquals(customer?.name, "John Doe", "Invalid customer name");
    setCommonCustomerId(customer.id);
}

@test:Config {
    groups: ["live_tests", "mock_tests"],
    dependsOn: [createCustomerTest]
}
function updateCustomerTest() returns error? {
    string customerId = getCommonCustomerId();
    record {|string...;|} metadata = {
        "businessType": "Stock trading"
    };
    customers_customer_body customerUpdate = { metadata };
    Customer customer = check stripe->/customers/[customerId].post(customerUpdate);
    test:assertEquals(customer.metadata, metadata, "Invalid meta-data found");
}

@test:Config {
    groups: ["live_tests", "mock_tests"],
    dependsOn: [updateCustomerTest]
}
function deleteCustomerTest() returns error? {
    string customerId = getCommonCustomerId();
    Deleted_customer deletedCustomer = check stripe->/customers/[customerId].delete();
    test:assertTrue(deletedCustomer.deleted, "Customer deletion successful");
}
