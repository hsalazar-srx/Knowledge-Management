---
risk: "LHDN production certificate expiry silently blocks all MyInvois submissions"
category: compliance
likelihood: medium
impact: critical
status: active
reviewed: 2026-03-04
early_warnings:
  - "Submission response changes from 200 to 401 Unauthorized"
  - "XAdES signer throws certificate exception in application logs"
  - "Certificate expiry alert from monitoring (if configured)"
  - "LHDN portal shows 'Invalid Signature' rejection reason"
mitigations:
  - "Set calendar reminder 90 days before certificate expiry date for renewal"
  - "Set calendar reminder 30 days before for escalation if renewal not started"
  - "Document certificate renewal procedure in runbooks/certificate-management.md"
  - "Configure automated expiry monitoring (check certificate NotAfter field on service startup)"
contingency:
  - "Use sandbox certificate temporarily while production cert is renewed (submissions will be test-only)"
  - "Contact LHDN helpdesk with prior submission records to negotiate grace period"
  - "Manual CSV submission via MyInvois portal as last resort"
---

## Context

The LHDN production certificate used for XAdES digital signatures has a 1-year validity period. If it expires without renewal, all invoice submissions will fail with signature validation errors. LHDN does not notify about expiry — it is the operator's responsibility to monitor.

The risk is classified as **medium likelihood** because the first certificate was issued close to go-live (February 2026), meaning the first renewal window is February 2027. There is currently no automated monitoring in place.

## Signal Log

| Date | Signal | Source | Impact |
|------|--------|--------|--------|
| 2026-03-04 | No monitoring configured at go-live | Architecture review | High — gap identified |

## Related

- Project: [[myinvois-phase1|MyInvois Phase 1]]
- Decision: [[adr-013-db2-direct-access-preferred-over-m3-api-for-myinvois|ADR-013 DB2 Direct Access]]
- Compliance: [[lhdn-myinvois-sdk-v1-5|LHDN MyInvois SDK v1.5]]
- Runbook: `runbooks/certificate-management.md` (to be created)
