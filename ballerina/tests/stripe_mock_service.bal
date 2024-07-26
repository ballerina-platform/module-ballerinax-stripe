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

service /v1 on new http:Listener(9090) {

    resource isolated function get accounts() returns AccountList {
        return {
            "object": "list",
            "url": "/v1/accounts",
            "has_more": false,
            "data": [
                {
                    "id": "acct_1Nv0FGQ9RKHgCVdK",
                    "object": "account",
                    "business_profile": {
                        "annual_revenue": null,
                        "estimated_worker_count": null,
                        "mcc": null,
                        "name": null,
                        "product_description": null,
                        "support_address": null,
                        "support_email": null,
                        "support_phone": null,
                        "support_url": null,
                        "url": null
                    },
                    "business_type": null,
                    "capabilities": {},
                    "charges_enabled": false,
                    "controller": {
                        "fees": {
                            "payer": "application"
                        },
                        "is_controller": true,
                        "losses": {
                            "payments": "application"
                        },
                        "requirement_collection": "stripe",
                        "stripe_dashboard": {
                            "type": "express"
                        },
                        "type": "application"
                    },
                    "country": "US",
                    "created": 1695830751,
                    "default_currency": "usd",
                    "details_submitted": false,
                    "email": "jenny.rosen@example.com",
                    "external_accounts": {
                        "object": "list",
                        "data": [],
                        "has_more": false,
                        "total_count": 0,
                        "url": "/v1/accounts/acct_1Nv0FGQ9RKHgCVdK/external_accounts"
                    },
                    "future_requirements": {
                        "alternatives": [],
                        "current_deadline": null,
                        "currently_due": [],
                        "disabled_reason": null,
                        "errors": [],
                        "eventually_due": [],
                        "past_due": [],
                        "pending_verification": []
                    },
                    "login_links": {
                        "object": "list",
                        "total_count": 0,
                        "has_more": false,
                        "url": "/v1/accounts/acct_1Nv0FGQ9RKHgCVdK/login_links",
                        "data": []
                    },
                    "metadata": {},
                    "payouts_enabled": false,
                    "requirements": {
                        "alternatives": [],
                        "current_deadline": null,
                        "currently_due": [
                            "business_profile.mcc",
                            "business_profile.url",
                            "business_type",
                            "external_account",
                            "representative.first_name",
                            "representative.last_name",
                            "tos_acceptance.date",
                            "tos_acceptance.ip"
                        ],
                        "disabled_reason": "requirements.past_due",
                        "errors": [],
                        "eventually_due": [
                            "business_profile.mcc",
                            "business_profile.url",
                            "business_type",
                            "external_account",
                            "representative.first_name",
                            "representative.last_name",
                            "tos_acceptance.date",
                            "tos_acceptance.ip"
                        ],
                        "past_due": [
                            "business_profile.mcc",
                            "business_profile.url",
                            "business_type",
                            "external_account",
                            "representative.first_name",
                            "representative.last_name",
                            "tos_acceptance.date",
                            "tos_acceptance.ip"
                        ],
                        "pending_verification": []
                    },
                    "settings": {
                        "bacs_debit_payments": {
                            "display_name": null,
                            "service_user_number": null
                        },
                        "branding": {
                            "icon": null,
                            "logo": null,
                            "primary_color": null,
                            "secondary_color": null
                        },
                        "card_issuing": {
                            "tos_acceptance": {
                                "date": null,
                                "ip": null
                            }
                        },
                        "card_payments": {
                            "decline_on": {
                                "avs_failure": false,
                                "cvc_failure": false
                            },
                            "statement_descriptor_prefix": null,
                            "statement_descriptor_prefix_kanji": null,
                            "statement_descriptor_prefix_kana": null
                        },
                        "dashboard": {
                            "display_name": null,
                            "timezone": "Etc/UTC"
                        },
                        "invoices": {
                            "default_account_tax_ids": null
                        },
                        "payments": {
                            "statement_descriptor": null,
                            "statement_descriptor_kana": null,
                            "statement_descriptor_kanji": null
                        },
                        "payouts": {
                            "debit_negative_balances": true,
                            "schedule": {
                                "delay_days": 2,
                                "interval": "daily"
                            },
                            "statement_descriptor": null
                        },
                        "sepa_debit_payments": {}
                    },
                    "tos_acceptance": {
                        "date": null,
                        "ip": null,
                        "user_agent": null
                    },
                    "type": "none"
                }
            ]
        };
    }

    resource isolated function post accounts() returns Account {
        return {
            "id": "acct_1Nv0FGQ9RKHgCVdK",
            "object": "account",
            "business_profile": {
                "annual_revenue": null,
                "estimated_worker_count": null,
                "mcc": null,
                "name": null,
                "product_description": null,
                "support_address": null,
                "support_email": null,
                "support_phone": null,
                "support_url": null,
                "url": null
            },
            "business_type": null,
            "capabilities": {},
            "charges_enabled": false,
            "controller": {
                "fees": {
                    "payer": "application"
                },
                "is_controller": true,
                "losses": {
                    "payments": "application"
                },
                "requirement_collection": "stripe",
                "stripe_dashboard": {
                    "type": "express"
                },
                "type": "application"
            },
            "country": "US",
            "created": 1695830751,
            "default_currency": "usd",
            "details_submitted": false,
            "email": "jenny.rosen@example.com",
            "external_accounts": {
                "object": "list",
                "data": [],
                "has_more": false,
                "total_count": 0,
                "url": "/v1/accounts/acct_1Nv0FGQ9RKHgCVdK/external_accounts"
            },
            "future_requirements": {
                "alternatives": [],
                "current_deadline": null,
                "currently_due": [],
                "disabled_reason": null,
                "errors": [],
                "eventually_due": [],
                "past_due": [],
                "pending_verification": []
            },
            "login_links": {
                "object": "list",
                "total_count": 0,
                "has_more": false,
                "url": "/v1/accounts/acct_1Nv0FGQ9RKHgCVdK/login_links",
                "data": []
            },
            "metadata": {},
            "payouts_enabled": false,
            "requirements": {
                "alternatives": [],
                "current_deadline": null,
                "currently_due": [
                    "business_profile.mcc",
                    "business_profile.url",
                    "business_type",
                    "external_account",
                    "representative.first_name",
                    "representative.last_name",
                    "tos_acceptance.date",
                    "tos_acceptance.ip"
                ],
                "disabled_reason": "requirements.past_due",
                "errors": [],
                "eventually_due": [
                    "business_profile.mcc",
                    "business_profile.url",
                    "business_type",
                    "external_account",
                    "representative.first_name",
                    "representative.last_name",
                    "tos_acceptance.date",
                    "tos_acceptance.ip"
                ],
                "past_due": [
                    "business_profile.mcc",
                    "business_profile.url",
                    "business_type",
                    "external_account",
                    "representative.first_name",
                    "representative.last_name",
                    "tos_acceptance.date",
                    "tos_acceptance.ip"
                ],
                "pending_verification": []
            },
            "settings": {
                "bacs_debit_payments": {
                    "display_name": null,
                    "service_user_number": null
                },
                "branding": {
                    "icon": null,
                    "logo": null,
                    "primary_color": null,
                    "secondary_color": null
                },
                "card_issuing": {
                    "tos_acceptance": {
                        "date": null,
                        "ip": null
                    }
                },
                "card_payments": {
                    "decline_on": {
                        "avs_failure": false,
                        "cvc_failure": false
                    },
                    "statement_descriptor_prefix": null,
                    "statement_descriptor_prefix_kanji": null,
                    "statement_descriptor_prefix_kana": null
                },
                "dashboard": {
                    "display_name": null,
                    "timezone": "Etc/UTC"
                },
                "invoices": {
                    "default_account_tax_ids": null
                },
                "payments": {
                    "statement_descriptor": null,
                    "statement_descriptor_kana": null,
                    "statement_descriptor_kanji": null
                },
                "payouts": {
                    "debit_negative_balances": true,
                    "schedule": {
                        "delay_days": 2,
                        "interval": "daily"
                    },
                    "statement_descriptor": null
                },
                "sepa_debit_payments": {}
            },
            "tos_acceptance": {
                "date": null,
                "ip": null,
                "user_agent": null
            },
            "type": "none"
        };
    }

    resource isolated function get accounts/[string accountId]() returns Account {
        return {
            "id": "acct_1Nv0FGQ9RKHgCVdK",
            "object": "account",
            "business_profile": {
                "annual_revenue": null,
                "estimated_worker_count": null,
                "mcc": null,
                "name": null,
                "product_description": null,
                "support_address": null,
                "support_email": null,
                "support_phone": null,
                "support_url": null,
                "url": null
            },
            "business_type": null,
            "capabilities": {},
            "charges_enabled": false,
            "controller": {
                "fees": {
                    "payer": "application"
                },
                "is_controller": true,
                "losses": {
                    "payments": "application"
                },
                "requirement_collection": "stripe",
                "stripe_dashboard": {
                    "type": "express"
                },
                "type": "application"
            },
            "country": "US",
            "created": 1695830751,
            "default_currency": "usd",
            "details_submitted": false,
            "email": "jenny.rosen@example.com",
            "external_accounts": {
                "object": "list",
                "data": [],
                "has_more": false,
                "total_count": 0,
                "url": "/v1/accounts/acct_1Nv0FGQ9RKHgCVdK/external_accounts"
            },
            "future_requirements": {
                "alternatives": [],
                "current_deadline": null,
                "currently_due": [],
                "disabled_reason": null,
                "errors": [],
                "eventually_due": [],
                "past_due": [],
                "pending_verification": []
            },
            "login_links": {
                "object": "list",
                "total_count": 0,
                "has_more": false,
                "url": "/v1/accounts/acct_1Nv0FGQ9RKHgCVdK/login_links",
                "data": []
            },
            "metadata": {},
            "payouts_enabled": false,
            "requirements": {
                "alternatives": [],
                "current_deadline": null,
                "currently_due": [
                    "business_profile.mcc",
                    "business_profile.url",
                    "business_type",
                    "external_account",
                    "representative.first_name",
                    "representative.last_name",
                    "tos_acceptance.date",
                    "tos_acceptance.ip"
                ],
                "disabled_reason": "requirements.past_due",
                "errors": [],
                "eventually_due": [
                    "business_profile.mcc",
                    "business_profile.url",
                    "business_type",
                    "external_account",
                    "representative.first_name",
                    "representative.last_name",
                    "tos_acceptance.date",
                    "tos_acceptance.ip"
                ],
                "past_due": [
                    "business_profile.mcc",
                    "business_profile.url",
                    "business_type",
                    "external_account",
                    "representative.first_name",
                    "representative.last_name",
                    "tos_acceptance.date",
                    "tos_acceptance.ip"
                ],
                "pending_verification": []
            },
            "settings": {
                "bacs_debit_payments": {
                    "display_name": null,
                    "service_user_number": null
                },
                "branding": {
                    "icon": null,
                    "logo": null,
                    "primary_color": null,
                    "secondary_color": null
                },
                "card_issuing": {
                    "tos_acceptance": {
                        "date": null,
                        "ip": null
                    }
                },
                "card_payments": {
                    "decline_on": {
                        "avs_failure": false,
                        "cvc_failure": false
                    },
                    "statement_descriptor_prefix": null,
                    "statement_descriptor_prefix_kanji": null,
                    "statement_descriptor_prefix_kana": null
                },
                "dashboard": {
                    "display_name": null,
                    "timezone": "Etc/UTC"
                },
                "invoices": {
                    "default_account_tax_ids": null
                },
                "payments": {
                    "statement_descriptor": null,
                    "statement_descriptor_kana": null,
                    "statement_descriptor_kanji": null
                },
                "payouts": {
                    "debit_negative_balances": true,
                    "schedule": {
                        "delay_days": 2,
                        "interval": "daily"
                    },
                    "statement_descriptor": null
                },
                "sepa_debit_payments": {}
            },
            "tos_acceptance": {
                "date": null,
                "ip": null,
                "user_agent": null
            },
            "type": "none"
        };
    }

    resource isolated function delete accounts/[string accountId]() returns Deleted_account {
        return {
            "id": "acct_1Nv0FGQ9RKHgCVdK",
            "object": "account",
            "deleted": true,
            "business_profile": {
                "annual_revenue": null,
                "estimated_worker_count": null,
                "mcc": null,
                "name": null,
                "product_description": null,
                "support_address": null,
                "support_email": null,
                "support_phone": null,
                "support_url": null,
                "url": null
            },
            "business_type": null,
            "capabilities": {},
            "charges_enabled": false,
            "controller": {
                "fees": {
                    "payer": "application"
                },
                "is_controller": true,
                "losses": {
                    "payments": "application"
                },
                "requirement_collection": "stripe",
                "stripe_dashboard": {
                    "type": "express"
                },
                "type": "application"
            },
            "country": "US",
            "created": 1385798567,
            "default_currency": "usd",
            "details_submitted": true,
            "email": "jenny.rosen@example.com",
            "external_accounts": {
                "object": "list",
                "data": [],
                "has_more": false,
                "total_count": 0,
                "url": "/v1/accounts/acct_1Nv0FGQ9RKHgCVdK/external_accounts"
            },
            "future_requirements": {
                "alternatives": [],
                "current_deadline": null,
                "currently_due": [],
                "disabled_reason": null,
                "errors": [],
                "eventually_due": [],
                "past_due": [],
                "pending_verification": []
            },
            "login_links": {
                "object": "list",
                "total_count": 0,
                "has_more": false,
                "url": "/v1/accounts/acct_1Nv0FGQ9RKHgCVdK/login_links",
                "data": []
            },
            "metadata": {},
            "payouts_enabled": true,
            "requirements": {
                "alternatives": [],
                "current_deadline": null,
                "currently_due": [
                    "business_profile.mcc",
                    "business_profile.product_description",
                    "business_profile.support_phone",
                    "business_profile.url",
                    "business_type",
                    "external_account",
                    "person_8UayFKIMRJklog.first_name",
                    "person_8UayFKIMRJklog.last_name",
                    "tos_acceptance.date",
                    "tos_acceptance.ip"
                ],
                "disabled_reason": "rejected.fraud",
                "errors": [],
                "eventually_due": [
                    "business_profile.mcc",
                    "business_profile.product_description",
                    "business_profile.support_phone",
                    "business_profile.url",
                    "business_type",
                    "external_account",
                    "person_8UayFKIMRJklog.first_name",
                    "person_8UayFKIMRJklog.last_name",
                    "tos_acceptance.date",
                    "tos_acceptance.ip"
                ],
                "past_due": [
                    "business_profile.mcc",
                    "business_profile.product_description",
                    "business_profile.support_phone",
                    "business_profile.url",
                    "business_type",
                    "external_account",
                    "person_8UayFKIMRJklog.first_name",
                    "person_8UayFKIMRJklog.last_name",
                    "tos_acceptance.date",
                    "tos_acceptance.ip"
                ],
                "pending_verification": []
            },
            "settings": {
                "bacs_debit_payments": {
                    "display_name": null,
                    "service_user_number": null
                },
                "branding": {
                    "icon": null,
                    "logo": null,
                    "primary_color": null,
                    "secondary_color": null
                },
                "card_issuing": {
                    "tos_acceptance": {
                        "date": null,
                        "ip": null
                    }
                },
                "card_payments": {
                    "decline_on": {
                        "avs_failure": false,
                        "cvc_failure": false
                    },
                    "statement_descriptor_prefix": null,
                    "statement_descriptor_prefix_kanji": null,
                    "statement_descriptor_prefix_kana": null
                },
                "dashboard": {
                    "display_name": null,
                    "timezone": "Etc/UTC"
                },
                "invoices": {
                    "default_account_tax_ids": null
                },
                "payments": {
                    "statement_descriptor": null,
                    "statement_descriptor_kana": null,
                    "statement_descriptor_kanji": null
                },
                "payouts": {
                    "debit_negative_balances": true,
                    "schedule": {
                        "delay_days": 2,
                        "interval": "daily"
                    },
                    "statement_descriptor": null
                },
                "sepa_debit_payments": {}
            },
            "tos_acceptance": {
                "date": null,
                "ip": null,
                "user_agent": null
            },
            "type": "none"
        };
    }

    resource isolated function post accounts/[string accountId]/reject() returns Account {
        return {
            "id": "acct_1Nv0FGQ9RKHgCVdK",
            "object": "account",
            "business_profile": {
                "annual_revenue": null,
                "estimated_worker_count": null,
                "mcc": null,
                "name": null,
                "product_description": null,
                "support_address": null,
                "support_email": null,
                "support_phone": null,
                "support_url": null,
                "url": null
            },
            "business_type": null,
            "capabilities": {},
            "charges_enabled": false,
            "controller": {
                "fees": {
                    "payer": "application"
                },
                "is_controller": true,
                "losses": {
                    "payments": "application"
                },
                "requirement_collection": "stripe",
                "stripe_dashboard": {
                    "type": "express"
                },
                "type": "application"
            },
            "country": "US",
            "created": 1385798567,
            "default_currency": "usd",
            "details_submitted": true,
            "email": "jenny.rosen@example.com",
            "external_accounts": {
                "object": "list",
                "data": [],
                "has_more": false,
                "total_count": 0,
                "url": "/v1/accounts/acct_1Nv0FGQ9RKHgCVdK/external_accounts"
            },
            "future_requirements": {
                "alternatives": [],
                "current_deadline": null,
                "currently_due": [],
                "disabled_reason": null,
                "errors": [],
                "eventually_due": [],
                "past_due": [],
                "pending_verification": []
            },
            "login_links": {
                "object": "list",
                "total_count": 0,
                "has_more": false,
                "url": "/v1/accounts/acct_1Nv0FGQ9RKHgCVdK/login_links",
                "data": []
            },
            "metadata": {},
            "payouts_enabled": true,
            "requirements": {
                "alternatives": [],
                "current_deadline": null,
                "currently_due": [
                    "business_profile.mcc",
                    "business_profile.product_description",
                    "business_profile.support_phone",
                    "business_profile.url",
                    "business_type",
                    "external_account",
                    "person_8UayFKIMRJklog.first_name",
                    "person_8UayFKIMRJklog.last_name",
                    "tos_acceptance.date",
                    "tos_acceptance.ip"
                ],
                "disabled_reason": "rejected.fraud",
                "errors": [],
                "eventually_due": [
                    "business_profile.mcc",
                    "business_profile.product_description",
                    "business_profile.support_phone",
                    "business_profile.url",
                    "business_type",
                    "external_account",
                    "person_8UayFKIMRJklog.first_name",
                    "person_8UayFKIMRJklog.last_name",
                    "tos_acceptance.date",
                    "tos_acceptance.ip"
                ],
                "past_due": [
                    "business_profile.mcc",
                    "business_profile.product_description",
                    "business_profile.support_phone",
                    "business_profile.url",
                    "business_type",
                    "external_account",
                    "person_8UayFKIMRJklog.first_name",
                    "person_8UayFKIMRJklog.last_name",
                    "tos_acceptance.date",
                    "tos_acceptance.ip"
                ],
                "pending_verification": []
            },
            "settings": {
                "bacs_debit_payments": {
                    "display_name": null,
                    "service_user_number": null
                },
                "branding": {
                    "icon": null,
                    "logo": null,
                    "primary_color": null,
                    "secondary_color": null
                },
                "card_issuing": {
                    "tos_acceptance": {
                        "date": null,
                        "ip": null
                    }
                },
                "card_payments": {
                    "decline_on": {
                        "avs_failure": false,
                        "cvc_failure": false
                    },
                    "statement_descriptor_prefix": null,
                    "statement_descriptor_prefix_kanji": null,
                    "statement_descriptor_prefix_kana": null
                },
                "dashboard": {
                    "display_name": null,
                    "timezone": "Etc/UTC"
                },
                "invoices": {
                    "default_account_tax_ids": null
                },
                "payments": {
                    "statement_descriptor": null,
                    "statement_descriptor_kana": null,
                    "statement_descriptor_kanji": null
                },
                "payouts": {
                    "debit_negative_balances": true,
                    "schedule": {
                        "delay_days": 2,
                        "interval": "daily"
                    },
                    "statement_descriptor": null
                },
                "sepa_debit_payments": {}
            },
            "tos_acceptance": {
                "date": null,
                "ip": null,
                "user_agent": null
            },
            "type": "none"
        };
    }

    resource function post charges() returns Charge {
        return {
            "amount": 100,
            "amount_captured": 100,
            "amount_refunded": 0,
            "application": null,
            "application_fee": null,
            "application_fee_amount": null,
            "balance_transaction": "txn_3PgJWTEp9MtApYEv0YxdVj7L",
            "billing_details": {"address": {"city": null, "country": null, "line1": null, "line2": null, "postal_code": null, "state": null}, "email": null, "name": null, "phone": null},
            "calculated_statement_descriptor": "Stripe",
            "captured": true,
            "created": 1721882605,
            "currency": "usd",
            "customer": null,
            "description": null,
            "disputed": false,
            "failure_balance_transaction": null,
            "failure_code": null,
            "failure_message": null,
            "fraud_details": {},
            "id": "ch_3PgJWTEp9MtApYEv0wAzhr89",
            "invoice": null,
            "livemode": false,
            "metadata": {},
            "object": "charge",
            "on_behalf_of": null,
            "outcome": {"network_status": "approved_by_network", "reason": null, "risk_level": "normal", "risk_score": 23, "seller_message": "Payment complete.", "type": "authorized"},
            "paid": true,
            "payment_intent": null,
            "payment_method": "card_1PgJWTEp9MtApYEvUXX6dMfO",
            "payment_method_details": {"card": {"amount_authorized": 100, "brand": "visa", "checks": {"address_line1_check": null, "address_postal_code_check": null, "cvc_check": "pass"}, "country": "US", "exp_month": 7, "exp_year": 2025, "extended_authorization": {"status": "disabled"}, "fingerprint": "LiZ5Kn2xJfZDiuHM", "funding": "credit", "incremental_authorization": {"status": "unavailable"}, "installments": null, "last4": "4242", "mandate": null, "multicapture": {"status": "unavailable"}, "network": "visa", "network_token": {"used": false}, "overcapture": {"maximum_amount_capturable": 100, "status": "unavailable"}, "three_d_secure": null, "wallet": null, "authorization_code": null}, "type": "card"},
            "receipt_email": null,
            "receipt_number": null,
            "receipt_url": "https://pay.stripe.com/receipts/payment/CAcaFwoVYWNjdF8xUGU5R3VFcDlNdEFwWUV2KO6vh7UGMgZd42C858w6LBbEZR8eRicdo8xU0QQ_MOrNqzJ3NAqDesXA1ADMXJZ2JHBkyv9Ay32Kh6ci",
            "refunded": false,
            "review": null,
            "shipping": null,
            "source_transfer": null,
            "statement_descriptor": null,
            "statement_descriptor_suffix": null,
            "status": "succeeded",
            "transfer_data": null,
            "transfer_group": null,
            "destination": null,
            "source": {"id": "card_1PgJWTEp9MtApYEvUXX6dMfO", "object": "card", "address_city": null, "address_country": null, "address_line1": null, "address_line1_check": null, "address_line2": null, "address_state": null, "address_zip": null, "address_zip_check": null, "brand": "Visa", "country": "US", "customer": null, "cvc_check": "pass", "dynamic_last4": null, "exp_month": 7, "exp_year": 2025, "fingerprint": "LiZ5Kn2xJfZDiuHM", "funding": "credit", "last4": "4242", "metadata": {}, "name": null, "tokenization_method": null, "wallet": null},
            "order": null,
            "dispute": null
        };
    }

    resource function get charges/[string chargeId]() returns Charge {
        return {
            "amount": 100,
            "amount_captured": 100,
            "amount_refunded": 0,
            "application": null,
            "application_fee": null,
            "application_fee_amount": null,
            "balance_transaction": "txn_3PgJWTEp9MtApYEv0YxdVj7L",
            "billing_details": {"address": {"city": null, "country": null, "line1": null, "line2": null, "postal_code": null, "state": null}, "email": null, "name": null, "phone": null},
            "calculated_statement_descriptor": "Stripe",
            "captured": true,
            "created": 1721882605,
            "currency": "usd",
            "customer": null,
            "description": null,
            "disputed": false,
            "failure_balance_transaction": null,
            "failure_code": null,
            "failure_message": null,
            "fraud_details": {},
            "id": "ch_3PgJWTEp9MtApYEv0wAzhr89",
            "invoice": null,
            "livemode": false,
            "metadata": {},
            "object": "charge",
            "on_behalf_of": null,
            "outcome": {"network_status": "approved_by_network", "reason": null, "risk_level": "normal", "risk_score": 23, "seller_message": "Payment complete.", "type": "authorized"},
            "paid": true,
            "payment_intent": null,
            "payment_method": "card_1PgJWTEp9MtApYEvUXX6dMfO",
            "payment_method_details": {"card": {"amount_authorized": 100, "brand": "visa", "checks": {"address_line1_check": null, "address_postal_code_check": null, "cvc_check": "pass"}, "country": "US", "exp_month": 7, "exp_year": 2025, "extended_authorization": {"status": "disabled"}, "fingerprint": "LiZ5Kn2xJfZDiuHM", "funding": "credit", "incremental_authorization": {"status": "unavailable"}, "installments": null, "last4": "4242", "mandate": null, "multicapture": {"status": "unavailable"}, "network": "visa", "network_token": {"used": false}, "overcapture": {"maximum_amount_capturable": 100, "status": "unavailable"}, "three_d_secure": null, "wallet": null, "authorization_code": null}, "type": "card"},
            "receipt_email": null,
            "receipt_number": null,
            "receipt_url": "https://pay.stripe.com/receipts/payment/CAcaFwoVYWNjdF8xUGU5R3VFcDlNdEFwWUV2KO6vh7UGMgZd42C858w6LBbEZR8eRicdo8xU0QQ_MOrNqzJ3NAqDesXA1ADMXJZ2JHBkyv9Ay32Kh6ci",
            "refunded": false,
            "review": null,
            "shipping": null,
            "source_transfer": null,
            "statement_descriptor": null,
            "statement_descriptor_suffix": null,
            "status": "succeeded",
            "transfer_data": null,
            "transfer_group": null,
            "destination": null,
            "source": {"id": "card_1PgJWTEp9MtApYEvUXX6dMfO", "object": "card", "address_city": null, "address_country": null, "address_line1": null, "address_line1_check": null, "address_line2": null, "address_state": null, "address_zip": null, "address_zip_check": null, "brand": "Visa", "country": "US", "customer": null, "cvc_check": "pass", "dynamic_last4": null, "exp_month": 7, "exp_year": 2025, "fingerprint": "LiZ5Kn2xJfZDiuHM", "funding": "credit", "last4": "4242", "metadata": {}, "name": null, "tokenization_method": null, "wallet": null},
            "order": null,
            "dispute": null
        };
    }

    resource function post charges/[string chargeId]() returns Charge {
        return {
            "amount": 100,
            "amount_captured": 100,
            "amount_refunded": 0,
            "application": null,
            "application_fee": null,
            "application_fee_amount": null,
            "balance_transaction": "txn_3PgKBYEp9MtApYEv0TKTlN3y",
            "billing_details": {"address": {"city": null, "country": null, "line1": null, "line2": null, "postal_code": null, "state": null}, "email": null, "name": null, "phone": null},
            "calculated_statement_descriptor": "Stripe",
            "captured": true,
            "created": 1721885152,
            "currency": "usd",
            "customer": null,
            "description": null,
            "disputed": false,
            "failure_balance_transaction": null,
            "failure_code": null,
            "failure_message": null,
            "fraud_details": {},
            "id": "ch_3PgKBYEp9MtApYEv0gsUMFKw",
            "invoice": null,
            "livemode": false,
            "metadata": {"shipping": "express"},
            "object": "charge",
            "on_behalf_of": null,
            "outcome": {"network_status": "approved_by_network", "reason": null, "risk_level": "normal", "risk_score": 53, "seller_message": "Payment complete.", "type": "authorized"},
            "paid": true,
            "payment_intent": null,
            "payment_method": "card_1PgKBYEp9MtApYEvSKN2jAlp",
            "payment_method_details": {"card": {"amount_authorized": 100, "brand": "visa", "checks": {"address_line1_check": null, "address_postal_code_check": null, "cvc_check": "pass"}, "country": "US", "exp_month": 7, "exp_year": 2025, "extended_authorization": {"status": "disabled"}, "fingerprint": "LiZ5Kn2xJfZDiuHM", "funding": "credit", "incremental_authorization": {"status": "unavailable"}, "installments": null, "last4": "4242", "mandate": null, "multicapture": {"status": "unavailable"}, "network": "visa", "network_token": {"used": false}, "overcapture": {"maximum_amount_capturable": 100, "status": "unavailable"}, "three_d_secure": null, "wallet": null, "authorization_code": null}, "type": "card"},
            "receipt_email": null,
            "receipt_number": null,
            "receipt_url": "https://pay.stripe.com/receipts/payment/CAcaFwoVYWNjdF8xUGU5R3VFcDlNdEFwWUV2KOHDh7UGMgZBt9HZ4E46LBYLk4r05Qv0DROCgscvPYckxvpJ8duYEZC7ouus1ShIu3-7kQsVwdqJQkJS",
            "refunded": false,
            "review": null,
            "shipping": null,
            "source_transfer": null,
            "statement_descriptor": null,
            "statement_descriptor_suffix": null,
            "status": "succeeded",
            "transfer_data": null,
            "transfer_group": null,
            "destination": null,
            "source": {"id": "card_1PgKBYEp9MtApYEvSKN2jAlp", "object": "card", "address_city": null, "address_country": null, "address_line1": null, "address_line1_check": null, "address_line2": null, "address_state": null, "address_zip": null, "address_zip_check": null, "brand": "Visa", "country": "US", "customer": null, "cvc_check": "pass", "dynamic_last4": null, "exp_month": 7, "exp_year": 2025, "fingerprint": "LiZ5Kn2xJfZDiuHM", "funding": "credit", "last4": "4242", "metadata": {}, "name": null, "tokenization_method": null, "wallet": null},
            "order": null,
            "dispute": null
        };
    }

    resource function post charges/[string chargeId]/refund() returns Charge {
        return {
            "amount": 100,
            "amount_captured": 100,
            "amount_refunded": 100,
            "application": null,
            "application_fee": null,
            "application_fee_amount": null,
            "balance_transaction": "txn_3PgKTDEp9MtApYEv1dnBuPI5",
            "billing_details": {"address": {"city": null, "country": null, "line1": null, "line2": null, "postal_code": null, "state": null}, "email": null, "name": null, "phone": null},
            "calculated_statement_descriptor": "Stripe",
            "captured": true,
            "created": 1721886247,
            "currency": "usd",
            "customer": null,
            "description": null,
            "disputed": false,
            "failure_balance_transaction": null,
            "failure_code": null,
            "failure_message": null,
            "fraud_details": {},
            "id": "ch_3PgKTDEp9MtApYEv1rXNJFcV",
            "invoice": null,
            "livemode": false,
            "metadata": {"shipping": "express"},
            "object": "charge",
            "on_behalf_of": null,
            "outcome": {"network_status": "approved_by_network", "reason": null, "risk_level": "normal", "risk_score": 29, "seller_message": "Payment complete.", "type": "authorized"},
            "paid": true,
            "payment_intent": null,
            "payment_method": "card_1PgKTDEp9MtApYEviUWKRfe4",
            "payment_method_details": {"card": {"amount_authorized": 100, "brand": "visa", "checks": {"address_line1_check": null, "address_postal_code_check": null, "cvc_check": "pass"}, "country": "US", "exp_month": 7, "exp_year": 2025, "extended_authorization": {"status": "disabled"}, "fingerprint": "LiZ5Kn2xJfZDiuHM", "funding": "credit", "incremental_authorization": {"status": "unavailable"}, "installments": null, "last4": "4242", "mandate": null, "multicapture": {"status": "unavailable"}, "network": "visa", "network_token": {"used": false}, "overcapture": {"maximum_amount_capturable": 100, "status": "unavailable"}, "three_d_secure": null, "wallet": null, "authorization_code": null}, "type": "card"},
            "receipt_email": null,
            "receipt_number": null,
            "receipt_url": "https://pay.stripe.com/receipts/payment/CAcaFwoVYWNjdF8xUGU5R3VFcDlNdEFwWUV2KKnMh7UGMgbKnaoDu9Q6LBbUUk3YJf-dyw9BG_OWywI_nygay2hSHhiUyNkNaGQzPLx2jSHDHVzpy6nT",
            "refunded": true,
            "review": null,
            "shipping": null,
            "source_transfer": null,
            "statement_descriptor": null,
            "statement_descriptor_suffix": null,
            "status": "succeeded",
            "transfer_data": null,
            "transfer_group": null,
            "destination": null,
            "source": {"id": "card_1PgKTDEp9MtApYEviUWKRfe4", "object": "card", "address_city": null, "address_country": null, "address_line1": null, "address_line1_check": null, "address_line2": null, "address_state": null, "address_zip": null, "address_zip_check": null, "brand": "Visa", "country": "US", "customer": null, "cvc_check": "pass", "dynamic_last4": null, "exp_month": 7, "exp_year": 2025, "fingerprint": "LiZ5Kn2xJfZDiuHM", "funding": "credit", "last4": "4242", "metadata": {}, "name": null, "tokenization_method": null, "wallet": null},
            "order": null,
            "dispute": null
        };
    }

    resource function post payment_intents() returns Payment_intent {
        return {
            "amount": 100,
            "amount_capturable": 0,
            "amount_details": {"tip": {}},
            "amount_received": 0,
            "application": null,
            "application_fee_amount": null,
            "automatic_payment_methods": {"allow_redirects": "always", "enabled": true},
            "canceled_at": null,
            "cancellation_reason": null,
            "capture_method": "automatic_async",
            "client_secret": "pi_3PgKeSEp9MtApYEv0xgiej6C_secret_OJ99RVgHTY9AdoTxK70mu2W1c",
            "confirmation_method": "automatic",
            "created": 1721886944,
            "currency": "usd",
            "customer": null,
            "description": null,
            "id": "pi_3PgKeSEp9MtApYEv0xgiej6C",
            "invoice": null,
            "last_payment_error": null,
            "latest_charge": null,
            "livemode": false,
            "metadata": {},
            "next_action": null,
            "object": "payment_intent",
            "on_behalf_of": null,
            "payment_method": null,
            "payment_method_configuration_details": null,
            "payment_method_options": {
                "card": <Payment_intent_payment_method_options_card>{
                    "installments": null,
                    "mandate_options": null,
                    "network": null,
                    "request_three_d_secure": "automatic"
                }
            },
            "payment_method_types": ["card"],
            "processing": null,
            "receipt_email": null,
            "review": null,
            "setup_future_usage": null,
            "shipping": null,
            "statement_descriptor": null,
            "statement_descriptor_suffix": null,
            "status": "requires_payment_method",
            "transfer_data": null,
            "transfer_group": null,
            "source": null
        };
    }

    resource function post payment_intents/[string paymentId]() returns Payment_intent {
        return {
            "amount": 100,
            "amount_capturable": 0,
            "amount_details": {"tip": {}},
            "amount_received": 0,
            "application": null,
            "application_fee_amount": null,
            "automatic_payment_methods": {"allow_redirects": "always", "enabled": true},
            "canceled_at": null,
            "cancellation_reason": null,
            "capture_method": "automatic_async",
            "client_secret": "pi_3PgKiMEp9MtApYEv19CZMUus_secret_gePNqBIZNb5yCxdOtY3Pp90hr",
            "confirmation_method": "automatic",
            "created": 1721887186,
            "currency": "usd",
            "customer": null,
            "description": null,
            "id": "pi_3PgKiMEp9MtApYEv19CZMUus",
            "invoice": null,
            "last_payment_error": null,
            "latest_charge": null,
            "livemode": false,
            "metadata": {"orderId": "1234"},
            "next_action": null,
            "object": "payment_intent",
            "on_behalf_of": null,
            "payment_method": null,
            "payment_method_configuration_details": null,
            "payment_method_options": {
                "card": <Payment_intent_payment_method_options_card>{
                    "installments": null,
                    "mandate_options": null,
                    "network": null,
                    "request_three_d_secure": "automatic"
                }
            },
            "payment_method_types": ["card"],
            "processing": null,
            "receipt_email": null,
            "review": null,
            "setup_future_usage": null,
            "shipping": null,
            "statement_descriptor": null,
            "statement_descriptor_suffix": null,
            "status": "requires_payment_method",
            "transfer_data": null,
            "transfer_group": null,
            "source": null
        };
    }

    resource function post payment_intents/[string paymentId]/confirm() returns Payment_intent {
        return {
            "amount": 100,
            "amount_capturable": 0,
            "amount_details": {"tip": {}},
            "amount_received": 100,
            "application": null,
            "application_fee_amount": null,
            "automatic_payment_methods": {"allow_redirects": "always", "enabled": true},
            "canceled_at": null,
            "cancellation_reason": null,
            "capture_method": "automatic_async",
            "client_secret": "pi_3PgKnfEp9MtApYEv1yOripYv_secret_rIkQOQheQGIhkO2a93z7bw6XC",
            "confirmation_method": "automatic",
            "created": 1721887515,
            "currency": "usd",
            "customer": null,
            "description": null,
            "id": "pi_3PgKnfEp9MtApYEv1yOripYv",
            "invoice": null,
            "last_payment_error": null,
            "latest_charge": "ch_3PgKnfEp9MtApYEv132JMSHC",
            "livemode": false,
            "metadata": {"orderId": "1234"},
            "next_action": null,
            "object": "payment_intent",
            "on_behalf_of": null,
            "payment_method": "pm_1PgKnhEp9MtApYEvs8a3hPHQ",
            "payment_method_configuration_details": null,
            "payment_method_options": {
                "card": <Payment_intent_payment_method_options_card>{
                    "installments": null,
                    "mandate_options": null,
                    "network": null,
                    "request_three_d_secure": "automatic"
                }
            },
            "payment_method_types": ["card"],
            "processing": null,
            "receipt_email": null,
            "review": null,
            "setup_future_usage": null,
            "shipping": null,
            "statement_descriptor": null,
            "statement_descriptor_suffix": null,
            "status": "succeeded",
            "transfer_data": null,
            "transfer_group": null,
            "source": null
        };
    }

    resource function post payment_intents/[string paymentId]/cancel() returns Payment_intent {
        return {
            "amount": 100,
            "amount_capturable": 0,
            "amount_details": {"tip": {}},
            "amount_received": 0,
            "application": null,
            "application_fee_amount": null,
            "automatic_payment_methods": {"allow_redirects": "always", "enabled": true},
            "canceled_at": 1721888078,
            "cancellation_reason": "requested_by_customer",
            "capture_method": "automatic_async",
            "client_secret": "pi_3PgKwkEp9MtApYEv0VEIfCYK_secret_LtJ3GGe3oTqghI1vsdOaSOg4A",
            "confirmation_method": "automatic",
            "created": 1721888078,
            "currency": "usd",
            "customer": null,
            "description": null,
            "id": "pi_3PgKwkEp9MtApYEv0VEIfCYK",
            "invoice": null,
            "last_payment_error": null,
            "latest_charge": null,
            "livemode": false,
            "metadata": {},
            "next_action": null,
            "object": "payment_intent",
            "on_behalf_of": null,
            "payment_method": null,
            "payment_method_configuration_details": null,
            "payment_method_options": {
                "card": <Payment_intent_payment_method_options_card>{
                    "installments": null,
                    "mandate_options": null,
                    "network": null,
                    "request_three_d_secure": "automatic"
                }
            },
            "payment_method_types": ["card"],
            "processing": null,
            "receipt_email": null,
            "review": null,
            "setup_future_usage": null,
            "shipping": null,
            "statement_descriptor": null,
            "statement_descriptor_suffix": null,
            "status": "canceled",
            "transfer_data": null,
            "transfer_group": null,
            "source": null
        };
    }

    resource function post refunds() returns Refund {
        return {
            "amount": 100,
            "balance_transaction": "txn_3PgNJ2Ep9MtApYEv16pDzUFG",
            "charge": "ch_3PgNJ2Ep9MtApYEv17bvwb8s",
            "created": 1721897150,
            "currency": "usd",
            "destination_details": {"card": {"reference_status": "pending", "reference_type": "acquirer_reference_number", "type": "refund"}, "type": "card"},
            "id": "re_3PgNJ2Ep9MtApYEv1NkZPAmt",
            "metadata": {},
            "object": "refund",
            "payment_intent": "pi_3PgNJ2Ep9MtApYEv1elxFE4i",
            "reason": null,
            "receipt_number": null,
            "source_transfer_reversal": null,
            "status": "succeeded",
            "transfer_reversal": null
        };
    }

    resource function post refunds/[string refundId]() returns Refund {
        return {
            "amount": 100,
            "balance_transaction": "txn_3PgNO3Ep9MtApYEv1TFyWBE8",
            "charge": "ch_3PgNO3Ep9MtApYEv1w2DB0AM",
            "created": 1721897461,
            "currency": "usd",
            "destination_details": {"card": {"reference": "7145323746372014", "reference_status": "available", "reference_type": "acquirer_reference_number", "type": "refund"}, "type": "card"},
            "id": "re_3PgNO3Ep9MtApYEv1RmWiVL9",
            "metadata": {"orderId": "1234"},
            "object": "refund",
            "payment_intent": "pi_3PgNO3Ep9MtApYEv19eS3KIE",
            "reason": null,
            "receipt_number": null,
            "source_transfer_reversal": null,
            "status": "succeeded",
            "transfer_reversal": null
        };
    }

    resource function post customers() returns Customer {
        return {
            "address": {"city": "Colombo", "country": "Sri Lanka", "line1": null, "line2": null, "postal_code": null, "state": null},
            "balance": 0,
            "created": 1721905869,
            "currency": null,
            "default_source": null,
            "delinquent": false,
            "description": null,
            "discount": null,
            "email": "john.doe@sample.com",
            "id": "cus_QXUYB9FWx8FkoU",
            "invoice_prefix": "36CBD0CC",
            "invoice_settings": {"custom_fields": null, "default_payment_method": null, "footer": null, "rendering_options": null},
            "livemode": false,
            "metadata": {},
            "name": "John Doe",
            "next_invoice_sequence": 1,
            "object": "customer",
            "phone": null,
            "preferred_locales": [],
            "shipping": null,
            "tax_exempt": "none",
            "test_clock": null
        };
    }

    resource function post customers/[string customerId]() returns Customer {
        return {
            "address": {"city": "Colombo", "country": "Sri Lanka", "line1": null, "line2": null, "postal_code": null, "state": null},
            "balance": 0,
            "created": 1721906186,
            "currency": null,
            "default_source": null,
            "delinquent": false,
            "description": null,
            "discount": null,
            "email": "john.doe@sample.com",
            "id": "cus_QXUeJYs4cN7BoY",
            "invoice_prefix": "8C3819F2",
            "invoice_settings": {"custom_fields": null, "default_payment_method": null, "footer": null, "rendering_options": null},
            "livemode": false,
            "metadata": {"businessType": "Stock trading"},
            "name": "John Doe",
            "next_invoice_sequence": 1,
            "object": "customer",
            "phone": null,
            "preferred_locales": [],
            "shipping": null,
            "tax_exempt": "none",
            "test_clock": null
        };
    }

    resource function delete customers/[string customerId]() returns Deleted_customer {
        return {
            "deleted": true,
            "id": "cus_QXnyUG2EXDJbPP",
            "object": "customer"
        };
    }
}
