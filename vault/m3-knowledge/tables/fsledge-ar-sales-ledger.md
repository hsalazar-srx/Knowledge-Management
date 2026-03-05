---
table: FSLEDGE
description: "Accounts Receivable (AR) sales ledger transactions — holds all invoice and payment events per customer in MOVEX"
schema: MVXCOBJ
last_verified: 2026-02-11
related_tables:
  - FPLEDGE
  - FGINHE
  - OCUSMA
used_by:
  - Reporting-Service
known_quirks:
  - "One invoice (tran code 10) can have multiple associated payment records (tran code 20) — this is by design for partial payments. Always group by customer number + invoice number + invoice year to see the full picture"
  - "Do not assume a 1:1 relationship between tran 10 and tran 20 — multiple 20s against one 10 are normal"
  - "Use FSLEDGE as the starting point for AR ledger queries; join to lower-level tables only when more granular data is needed (per Max Wittmann, 2026-02-11)"
---

## Overview

FSLEDGE is the AR (Accounts Receivable) sales ledger in MOVEX. It records financial transactions at the customer level. Each row represents one transaction event for a customer invoice.

---

## Transaction (Tran) Codes

| Tran Code | Meaning | Notes |
|-----------|---------|-------|
| 10 | Invoice | One record per invoice issued. |
| 20 | Cash Receipt / Payment | One or more per invoice (for partial payments). Cancel transactions also appear here. |

**Key insight from Max Wittmann (2026-02-11):** An invoice will always have exactly one tran code 10 record, but may have multiple tran code 20 records if the customer makes partial payments.

---

## Recommended SQL Query Pattern

When querying AR balances or payment status, group by:
1. Customer number
2. Invoice number
3. Invoice year

This prevents double-counting and correctly handles the 1-to-many relationship between tran 10 and tran 20 records.

```sql
-- Example: AR balance view
SELECT
    CUNO,      -- Customer number
    IVNO,      -- Invoice number
    IVYR,      -- Invoice year
    SUM(CASE WHEN TTYP = 10 THEN IVAM ELSE 0 END) AS invoice_amount,
    SUM(CASE WHEN TTYP = 20 THEN IVAM ELSE 0 END) AS payments_received
FROM MVXCOBJ.FSLEDGE
WHERE CONO = 100
GROUP BY CUNO, IVNO, IVYR
```

*(Field names above are illustrative — verify actual column names before use. TTYP = transaction type / tran code.)*

---

## Related

- AP equivalent: `m3-knowledge/tables/fpledge-ap-purchase-ledger.md`
- AR invoice source: `m3-knowledge/tables/fginhe-invoice-header.md` (if exists)
- Decision: [[adr-013-db2-direct-access-preferred-over-m3-api-for-myinvois|ADR-013 DB2 Direct Access]]
