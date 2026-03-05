---
id: ADR-013
decision: "DB2 direct access is preferred over M3 MI API for MyInvois invoice data retrieval"
status: decided
date: 2026-01-15
reversibility: type-2-reversible
review_date: 2026-07-15
assumptions:
  - "DB2/AS400 remains directly accessible from the MyInvois-Service host"
  - "MOVEX DB2 schema for FGINHE/FGLINE/OAHEAD tables does not change without notice"
  - "Direct DB2 access provides sufficient read performance for monthly batch volumes (~100 sales, ~500-1000 purchases)"
  - "No licensing restriction prevents direct DB2 reads from the application server"
alternatives:
  - "M3 MI API (OIS100MI, FGR100MI) — rejected because M3 MI layer adds latency, requires M3 session management, and invoice retrieval programs are not optimised for batch reads"
  - "MOVEX-Portal as intermediate service — rejected because it creates a service-to-service dependency and adds a failure point for a compliance-critical workflow"
dependents: []
projects:
  - MyInvois-Service
---

## Context

MyInvois-Service needs to retrieve invoice data from MOVEX (sales invoices and purchase invoices) to transform them into LHDN UBL 2.1 format for submission to the MyInvois portal.

Three options were evaluated: direct DB2 access, M3 MI API calls, or reading through MOVEX-Portal as an intermediate service.

The MyInvois go-live deadline (February 28, 2026, iteration 1) and the low volume (~100 sales/month, ~500-1000 purchases/month) made simplicity the primary criterion.

## Decision

Use DB2/AS400 direct access via ODBC/IBM.Data.DB2 in the DataAccess layer. Query MOVEX tables directly:

- **Sales invoices:** `FGINHE` (invoice header) + `FGLINE` (invoice lines) + `OAHEAD` (order header for customer data)
- **Purchase invoices:** `MPHEAD` (PO header) + `MPLINE` (PO lines)
- **Customers/suppliers:** `OCUSMA` (customer master) + `CIDMAS` (supplier master)

Connection string managed via `dotnet user-secrets` (dev) and Windows DPAPI-encrypted file (prod). Connection pooling is enabled.

## Consequences

**Positive:**
- Simplest implementation path — no M3 session management, no token lifecycle
- Direct SQL gives full control over query shape and field selection
- Lower latency for batch reads than round-tripping through M3 MI layer

**Negative / trade-offs:**
- Tight coupling to MOVEX DB2 schema — schema changes require code changes
- DB2 ODBC driver must be installed and maintained on the service host
- No abstraction layer — if MOVEX migrates to IFS, this layer must be rewritten

## Review Criteria

This decision should be reviewed if:
- MOVEX/Infor announces schema changes to FGINHE, FGLINE, OAHEAD, or MPHEAD
- DB2 direct access is restricted by IT policy or licensing audit
- Invoice volume grows beyond 10,000/month (M3 MI API may become preferable)
- IFS migration project moves into active planning (IFS uses different data access patterns)

## Related

- Project: [[myinvois-phase1|MyInvois Phase 1]]
- Compliance: [[lhdn-myinvois-sdk-v1-5|LHDN MyInvois SDK v1.5]]
- Risk: [[certificate-expiry-blocks-myinvois-submission|Certificate Expiry Risk]]
- M3 table: [[ohedco|OHEDCO — Customer Order Header]]
