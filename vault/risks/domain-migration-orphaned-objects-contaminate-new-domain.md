---
risk: "Orphaned objects from the old IT domain contaminate the new domain if a trust relationship is established prematurely"
category: infrastructure
likelihood: low
impact: moderate
status: active
reviewed: 2026-02-12
early_warnings:
  - "Pressure to establish a domain trust to simplify application migration"
  - "Applications or services failing to function on the new domain, creating urgency to reconnect to old domain"
  - "AD cleanup on old domain deprioritised while migration proceeds"
mitigations:
  - "Manal Attalla confirmed the explicit approach: no trust between old and new domains (ADR-018)"
  - "Migrate applications to new domain individually with clean service accounts"
  - "Conduct AD cleanup on old domain in parallel with migration to reduce orphaned object count"
contingency:
  - "If a trust is required for a specific application: scope it narrowly (one-way, time-limited) and document the specific objects that will be visible"
decisions:
  - ADR-018
projects: []
---

## Context

Manal Attalla is managing the new domain setup. In the 2026-02-12 IT strategy meeting, she explained her deliberate choice not to trust the old domain: "I don't want the new domain to get bogged down with all of the orphaned objects." ADR-018 captures the formal decision.

The old domain has accumulated technical debt (orphaned users, groups, GPOs, service accounts) over many years — Karen acknowledged Manal "inherited" this state.

## Signal Log

| Date | Signal | Source |
|------|--------|--------|
| 2026-02-12 | Domain architecture discussed. Manal explicitly keeping new domain isolated from old to prevent orphaned object inheritance. Architecture design (by Zane) confirmed still current, to be published to SharePoint. | IT strategy meeting (Karen Lewin, Manal Attalla) |
