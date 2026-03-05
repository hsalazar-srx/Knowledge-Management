---
table: FPLEDGE
description: "Accounts Payable (AP) purchase ledger transactions — holds all invoice and payment events per supplier/vendor in MOVEX"
schema: MVXCOBJ
last_verified: 2026-02-11
related_tables:
  - FSLEDGE
known_quirks:
  - "One AP invoice (tran code 40) can have multiple associated payment records (tran code 50) — parallel structure to FSLEDGE AR ledger"
  - "Use FPLEDGE as the starting point for AP ledger queries; mirrors the FSLEDGE pattern on the AR side (per Max Wittmann, 2026-02-11)"
---

## Overview

FPLEDGE is the AP (Accounts Payable) purchase ledger in MOVEX. It records financial transactions at the vendor/supplier level. The structure mirrors FSLEDGE (AR ledger) but for payables.

---

## Transaction (Tran) Codes

| Tran Code | Meaning | Notes |
|-----------|---------|-------|
| 40 | AP Invoice | One record per supplier invoice received. |
| 50 | AP Payment | One or more per invoice (for partial payments). |

**Key insight from Max Wittmann (2026-02-11):** The AP tran code structure mirrors AR — tran 40 is the invoice event; tran 50 is the payment event. Multiple tran 50s against one tran 40 are normal for partial payments.

---

## Recommended SQL Query Pattern

Mirror the FSLEDGE pattern — group by vendor number, invoice number, and invoice year to correctly handle the 1-to-many relationship between tran 40 and tran 50 records.

---

## Related

- AR equivalent: `m3-knowledge/tables/fsledge-ar-sales-ledger.md`
- Decision: [[adr-013-db2-direct-access-preferred-over-m3-api-for-myinvois|ADR-013 DB2 Direct Access]]
