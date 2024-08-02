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

isolated string commonAccountId = "";

function setCommonAccountId(string accountId) {
    lock {
        commonAccountId = accountId;
    }
}

function getCommonAccountId() returns string {
    lock {
        return commonAccountId;
    }
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
    setCommonAccountId(account.id);
}

@test:Config {
    groups: ["live_tests", "mock_tests"],
    dependsOn: [createAccountTest]
}
function getAccountsTest() returns error? {
    AccountList accountsResponse = check stripe->/accounts;
    Account[] accounts = accountsResponse.data;
    test:assertTrue(accounts.length() > 0, "No accounts found");
}

@test:Config {
    groups: ["live_tests", "mock_tests"],
    dependsOn: [createAccountTest]
}
function getAccountTest() returns error? {
    string accountId = getCommonAccountId();
    Account account = check stripe->/accounts/[accountId];
    test:assertEquals(account.id, accountId, "Invalid account received");
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function deleteAccountTest() returns error? {
    accounts_body accountDetails = {
        country: "US",
        email: "jenny.rosen.deleted@example.com",
        default_currency: "usd"
    };  
    Account account = check stripe->/accounts.post(accountDetails);

    Deleted_account deletedAccount = check stripe->/accounts/[account.id].delete();
    test:assertEquals(deletedAccount.id, account.id, "Invalid account deleted");
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function rejectAccountTest() returns error? {
    accounts_body accountDetails = {
        country: "US",
        email: "jenny.rosen.rejected@example.com",
        default_currency: "usd"
    };  
    Account account = check stripe->/accounts.post(accountDetails);

    account_reject_body accountReject = {
        reason: "fraud"
    };
    Account rejectedAccount = check stripe->/accounts/[account.id]/reject.post(accountReject);
    test:assertEquals(rejectedAccount.id, account.id, "Invalid account rejected");
}
