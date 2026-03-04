---
table: OHEDCO
description: "Customer order header — primary table for sales order data in MOVEX"
schema: MVXCOBJ
last_verified: 2026-03-04
related_tables:
  - OAHEAD
  - FGINHE
  - OCUSMA
used_by:
  - MyInvois-Service
  - SM-Portal
---

## Overview

OHEDCO is the customer order header table. It contains one row per sales order. Key fields used by SRX integrations are listed below.

**Note:** Table is in the MVXCOBJ schema on the DB2/AS400 system. All queries must qualify the table name: `MVXCOBJ.OHEDCO`.

---

## Key Fields

| Field | Type | Length | Description |
|-------|------|--------|-------------|
| CONO | Numeric | 3 | Company number (SRX uses 100) |
| ORNO | Text | 10 | Order number — primary key |
| ORTP | Text | 3 | Order type (e.g., SO = sales order) |
| CUNO | Text | 10 | Customer number (FK to OCUSMA.CUNO) |
| CUCD | Text | 3 | Currency code (MYR, USD, etc.) |
| ORST | Numeric | 2 | Order status (66 = invoiced, 70 = closed) |
| IVDT | Numeric | 8 | Invoice date (YYYYMMDD format) |
| OREF | Text | 30 | Customer purchase order reference |
| SMCD | Text | 10 | Salesman code |
| WHLO | Text | 3 | Warehouse (default: 100) |
| CHID | Text | 10 | Last changed by (user ID) |
| LMDT | Numeric | 8 | Last modified date (YYYYMMDD) |
| RGDT | Numeric | 8 | Created date (YYYYMMDD) |

---

## Common Query Patterns

### Get all invoiced orders for a date range

```sql
SELECT ORNO, CUNO, IVDT, CUCD, ORST
FROM MVXCOBJ.OHEDCO
WHERE CONO = 100
  AND ORST >= 66
  AND IVDT BETWEEN 20260101 AND 20260131
ORDER BY IVDT
```

### Join with invoice header

```sql
SELECT o.ORNO, o.CUNO, i.IVNO, i.IVDT
FROM MVXCOBJ.OHEDCO o
INNER JOIN MVXCOBJ.FGINHE i ON o.CONO = i.CONO AND o.ORNO = i.ORNO
WHERE o.CONO = 100
  AND o.ORST = 66
```

---

## Known Quirks

- **Date fields are numeric YYYYMMDD** — not SQL DATE type. Cast when comparing: `DATE(DIGITS(IVDT))` or handle in application code.
- **ORST = 66 means "invoiced", 70 means "closed"** — for MyInvois purposes, query ORST >= 66.
- **No soft delete** — cancelled orders use ORST = 90, not a deleted flag.
- **CONO must always be included** — table is multi-company; forgetting CONO returns all companies' data.
- **Trailing spaces** — text fields are fixed-width and padded with spaces. Always TRIM() in application code or queries.
