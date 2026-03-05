---
risk: "Low PLM adoption due to UX and trust issues causes BOM data quality degradation and uncontrolled workarounds"
category: operational
likelihood: high
impact: moderate
status: active
reviewed: 2026-01-21
early_warnings:
  - "Staff bypassing PLM and managing BOM data in spreadsheets or Teams channels"
  - "BOM comparison being done manually rather than via Stargile PLM tools"
  - "RFQ not used by CBMs — alternative processes being used instead of the system"
  - "NPI DB replaced by Teams for customer communication — improvised workaround"
  - "Complaints about PLM giving 'questionable results' without investigation"
mitigations:
  - "Create a Teams PLM Roadmap to communicate planned UX fixes and build user confidence (TODO from 2026-01-21)"
  - "Fix identified UX issues: missing progress bars, word wrapping, colour legend, MPN field length"
  - "Run a structured training session on BOM comparison features that do work (MOVEX IPN comparison)"
  - "Formalise the RFQ and approval workflow to remove ambiguity that causes bypassing"
contingency:
  - "If BOM data quality degradation is detected: run a MOVEX BOM reconciliation to identify divergence from PLM records"
  - "If workarounds become entrenched: document them formally and include migration back to PLM in the roadmap"
---

## Context

Identified in the 2026-01-21 Melbourne Stargile/PLM/BOM session with Branko, NickN, and others. PLM (Stargile) is not being used as much as it should be, due to:

- Questionable results — users don't trust the output
- Interface is not user-friendly
- Missing progress bars — users don't know if operations are running
- Unclear approval process for new BOMs
- RFQ not used by CBMs — bypassed in favour of email

The consequence is BOM data drift between what's in PLM and what's in MOVEX, and an uncontrolled patchwork of workarounds (Teams, spreadsheets, manual entry).

## Related

- Decision ADR-023: PLM Stargile roadmap and UX fixes required
- Project: plm-stargile-bom
