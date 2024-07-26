// Copyright (c) 2024, WSO2 LLC. (http://www.wso2.com) All Rights Reserved.
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

import ballerina/log;
import ballerina/os;
import ballerina/test;

configurable boolean isLiveServer = os:getEnv("IS_LIVE_SERVER") == "true";
configurable string stripeSecret = isLiveServer ? os:getEnv("STRIPE_SECRET") : "test";

final Client stripe = check initClient();

function initClient() returns Client|error {
    if isLiveServer {
        log:printInfo("Running tests on actual server");
        return new ({auth: {token: stripeSecret}});
    }
    return new ({auth: {token: stripeSecret}}, "http://localhost:9090/v1");
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function getAccountsTest() returns error? {
    AccountList accountsResponse = check stripe->/accounts;
    Account[] accounts = accountsResponse.data;
    test:assertTrue(accounts.length() > 0, "No accounts found");
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function createAccountTest() returns error? {
    accounts_body accountDetails = {
        country: "US",
        email: "jenny.rosen@example.com",
        default_currency: "usd"
    };  
    Account account = check stripe->/accounts.post(accountDetails);
    test:assertTrue(account.country is string, "Could not find the country setting");
    test:assertTrue(account.default_currency is string, "Could not find the currency setting");
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function getAccountTest() returns error? {
    Account account = check stripe->/accounts/["acct_1Nv0FGQ9RKHgCVdK"];
    test:assertEquals(account.id, "acct_1Nv0FGQ9RKHgCVdK", "Invalid account received");
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function deleteAccountTest() returns error? {
    Deleted_account deletedAccount = check stripe->/accounts/["acct_1Nv0FGQ9RKHgCVdK"].delete();
    test:assertEquals(deletedAccount.id, "acct_1Nv0FGQ9RKHgCVdK", "Invalid account deleted");
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function rejectAccountTest() returns error? {
    account_reject_body accountReject = {
        reason: "fraud"
    };
    Account account = check stripe->/accounts/["acct_1Nv0FGQ9RKHgCVdK"]/reject.post(accountReject);
    test:assertEquals(account.id, "acct_1Nv0FGQ9RKHgCVdK", "Invalid account rejected");
}

