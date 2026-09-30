# Changelog

All notable changes to this project will be documented in this file.
The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- All operations of the Stripe API version `2026-09-30.endive` (612 operations).

### Changed

- Every operation is now a remote method named after the operation (for example `createCustomer`, `getPaymentIntent`, `confirmPaymentIntent`) instead of a resource method addressed by path.
- Request payload records are named `<Operation>Request`, and generic inline response types are given descriptive names.
- The default service URL is `https://api.stripe.com/v1`.
- Examples are renamed to `manage_payments` and `manage_one_time_charges` and use the new remote methods.

Migration from 1.x:

| 1.x | 2.x |
|---|---|
| `stripe->/customers.post(payload)` | `stripe->createCustomer(payload)` |
| `stripe->/customers` | `stripe->listCustomers()` |
| `stripe->/customers/[id]` | `stripe->getCustomer(id)` |
| `stripe->/payment_intents/[id]/confirm.post(payload)` | `stripe->confirmPaymentIntent(id, payload)` |
| `stripe->/refunds.post(payload)` | `stripe->createRefund(payload)` |

### Removed

- `Module.md` and `Package.md`, replaced by `README.md`.
- The split `types_*.bal` files; all types are in `types.bal`.
