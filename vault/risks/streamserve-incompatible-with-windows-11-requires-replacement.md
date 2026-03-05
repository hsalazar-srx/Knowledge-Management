---
risk: "StreamServe is incompatible with Windows 11 and the old DB server it runs on must be replaced, creating a gap in document output capability"
category: infrastructure
likelihood: high
impact: moderate
status: active
reviewed: 2026-02-12
early_warnings:
  - "StreamServe fails to run or produces errors on Windows 11 workstations or servers"
  - "Old DB server hosting StreamServe is decommissioned or flagged for end-of-life"
  - "IT team unable to reproduce StreamServe issues on modern OS for troubleshooting"
  - "Document generation (invoices, reports) via StreamServe starts failing in production"
mitigations:
  - "Identify alternative document output management solution — discussions with 'one team' referenced in 2026-02-12 meeting (team name TBC)"
  - "Evaluate whether StreamServe vendor (Open Text) offers a supported version compatible with Windows 11"
  - "Define which documents StreamServe currently generates and assess impact if it goes offline"
  - "Prioritise StreamServe replacement on IT roadmap once MyInvois and ECN rewrite are shipped"
contingency:
  - "If StreamServe fails before replacement is ready: identify manual fallback for each document type it generates"
  - "Retain old DB server on isolated network segment as emergency fallback during transition"
decisions:
  - ADR-018
projects: []
---

## Context

Raised by Manal Attalla in the 2026-02-12 IT strategy meeting: StreamServe "is no longer working with Windows 11." Karen confirmed the need to "get off the old DB serve" (old DB server). StreamServe is a back-end IT system — "no one uses except for IT" — used for document output management.

Karen noted this is a separate topic not requiring full discussion in this meeting, implying it is tracked elsewhere or will be addressed separately.

## Signal Log

| Date | Signal | Source |
|------|--------|--------|
| 2026-02-12 | Manal confirmed StreamServe no longer working with Windows 11. Karen confirmed need to migrate off old DB server. Discussions with one team about an alternative are underway (team TBC). | IT strategy meeting (Karen Lewin, Manal Attalla) |
