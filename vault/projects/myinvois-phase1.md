---
project: "MyInvois-Service Phase 1 — LHDN e-Invoicing Integration"
status: active
phase: "MVAI Iteration 1 — DB2 integration, UBL transformation, sandbox validation"
go_live: 2026-02-28
owner: "hsalazar / IT team"
key_decisions:
  - decisions/adr-013-db2-direct-access-preferred-over-m3-api-for-myinvois.md
open_risks:
  - risks/certificate-expiry-blocks-myinvois-submission.md
  - risks/lhdn-myinvois-api-breaking-changes-before-go-live.md
---

## Project Overview

MyInvois-Service is a standalone .NET 8 service that reads invoice data from MOVEX DB2/AS400 and submits them to the LHDN MyInvois portal in UBL 2.1 format with XAdES digital signatures.

**Regulatory deadline:** LHDN mandated e-invoicing for companies above the threshold. Phase 1 targets monthly batch submission (not real-time).

**Scope (Phase 1 — MVAI Iteration 1):**
- Sales invoices: ~100/month from MOVEX FGINHE/FGLINE
- Purchase invoices: ~500–1000/month from MOVEX MPHEAD/MPLINE
- Manual batch trigger (no scheduler in Phase 1)
- Sandbox validation before production go-live

## Architecture

```
MOVEX DB2/AS400
    ↓ direct ODBC
DataAccess layer (DB2ConnectionPool)
    ↓
InvoiceReader → UBL 2.1 transformer → XAdES signer → MyInvois REST API
    ↓
SQL Server (SRX_AuditLog) — 7-year retention
```

**Key dependencies:**
- IBM.Data.DB2 ODBC driver on host server
- LHDN production certificate (EFS-encrypted on server, 1-year validity)
- MyInvois SDK v1.5
- SQL Server (SRX_AuditLog database)

## Current Status

| Component | Status | Notes |
|-----------|--------|-------|
| DB2 DataAccess layer | Complete | Connection pooling, ODBC |
| Invoice reader (sales) | Complete | FGINHE + FGLINE |
| Invoice reader (purchases) | Complete | MPHEAD + MPLINE |
| UBL 2.1 transformation | Complete | Validated against LHDN schema |
| XAdES digital signature | Complete | Using LHDN sandbox cert |
| MyInvois API client | Complete | OAuth token management |
| Audit logging (SQL Server) | Complete | ISO 27001 schema |
| Sandbox testing | In progress | |
| Production certificate | Pending | Requires LHDN production cert |
| Production deployment | Pending | Post sandbox sign-off |

## Go-Live Checklist

- [ ] Sandbox test: 10 sales invoices submitted and accepted
- [ ] Sandbox test: 10 purchase invoices submitted and accepted
- [ ] Production certificate installed (EFS-encrypted)
- [ ] appsettings.Production.json validated
- [ ] IIS deployment to production host
- [ ] First production batch run (manual trigger)
- [ ] Audit log entries verified in SRX_AuditLog

## Phase 2 Scope (future)

- Scheduled batch submission (Windows Service or Hangfire)
- Real-time submission trigger from MOVEX posting
- Credit notes and debit notes
- MOVEX-Portal integration for status visibility
