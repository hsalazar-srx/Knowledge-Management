---
topic: "LHDN MyInvois SDK v1.5 — compliance requirements for e-invoice submission"
category: lhdn-myinvois
lhdn_sdk_version: "1.5"
myinvois_spec_version: "1.0"
effective_date: 2026-01-01
last_reviewed: 2026-03-04
affected_decisions:
  - decisions/adr-013-db2-direct-access-preferred-over-m3-api-for-myinvois.md
---

## Overview

LHDN MyInvois SDK v1.5 defines the technical requirements for e-invoice submission in Malaysia. SRX Manufacturing must comply with this specification for all B2B and B2C invoices above the mandatory threshold.

**Authority:** Lembaga Hasil Dalam Negeri Malaysia (LHDN)
**Legal basis:** Income Tax Act 1967, e-Invoicing guidelines
**Standards:** UBL 2.1, PEPPOL BIS Billing 3.0, XAdES digital signatures

---

## Document Types in Scope

| Type | Code | Notes |
|------|------|-------|
| Invoice | 01 | Standard sales invoice |
| Credit note | 02 | Must reference original invoice UUID |
| Debit note | 03 | Must reference original invoice UUID |
| Refund note | 04 | |
| Self-billed invoice | 11 | For purchases where supplier is not registered |

**Phase 1 scope:** Type 01 (invoice) only, both sales and purchases.

---

## Mandatory Fields (Invoice)

| Field | UBL path | Notes |
|-------|----------|-------|
| Supplier TIN | `AccountingSupplierParty/Party/PartyTaxScheme/CompanyID` | Must be valid LHDN TIN |
| Buyer TIN | `AccountingCustomerParty/Party/PartyTaxScheme/CompanyID` | Required for B2B |
| Invoice date | `IssueDate` | Format: YYYY-MM-DD |
| Invoice number | `ID` | Unique per supplier, max 50 chars |
| Currency | `DocumentCurrencyCode` | MYR for domestic |
| Line items | `InvoiceLine` | At least one line required |
| Tax subtotal | `TaxTotal/TaxSubtotal` | Per tax category |
| Payable amount | `LegalMonetaryTotal/PayableAmount` | Total with tax |

---

## Digital Signature Requirements

- Format: **XAdES-BES** (Basic Electronic Signature)
- Certificate: Issued by LHDN Root CA — must be installed on the service host
- Certificate validity: 1 year — must be renewed before expiry (see risk: certificate expiry)
- Signature placement: `ext:UBLExtensions` in the UBL document

---

## Submission Flow

```
1. Build UBL 2.1 XML document
2. Apply XAdES digital signature
3. Base64-encode the signed document
4. POST to /api/v1.0/documentsubmissions
   with OAuth 2.0 bearer token (client credentials flow)
5. Receive submission UUID
6. Poll /api/v1.0/documents/{uuid}/details for status
7. Store result in audit log (SQL Server SRX_AuditLog)
```

**Rate limits:**
- Submission API: 300 requests/minute per client
- Document details: 600 requests/minute
- MyInvois-Service must implement exponential backoff (Polly retry policy)

---

## Rejection Reasons (common)

| Code | Description | Fix |
|------|-------------|-----|
| DS001 | Invalid digital signature | Check certificate validity and XAdES format |
| DS002 | Certificate not trusted | Ensure LHDN Root CA is installed |
| FV001 | Missing mandatory field | Check required fields against schema |
| FV002 | Invalid TIN format | TIN must be 11–12 digits for NRIC-based, or 10 digits for BRN-based |
| DUP001 | Duplicate invoice number | Invoice ID already submitted — check audit log |

---

## Version Change Log

| SDK Version | Date | Key changes |
|-------------|------|-------------|
| 1.5 | 2026-01-01 | Current production version |
| 1.4 | 2025-09-01 | Added self-billed invoice type 11 |
| 1.3 | 2025-06-01 | Mandatory buyer TIN for B2B |

**Action required when LHDN releases a new version:**
1. Update this note with new version and changes
2. Run `/compliance-check` to identify affected decisions
3. Create or update risk if any field changes affect SRX's submission format
4. Update MyInvois-Service if schema changes require code changes
