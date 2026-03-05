---
id: ADR-018
decision: "New IT domain is set up without merging or trusting the old domain, to prevent orphaned objects contaminating the new environment"
status: decided
date: 2026-02-12
reversibility: type-2-reversible
review_date: 2026-05-12
assumptions:
  - "The old domain contains a significant number of orphaned objects (users, groups, GPOs, service accounts) accumulated over time"
  - "Migrating orphaned objects into the new domain would require substantial cleanup effort that outweighs the convenience of a trust relationship"
  - "Applications and services can be migrated to the new domain individually without requiring a domain trust"
alternatives:
  - "Establish a domain trust between old and new domains — rejected by Manal Attalla to avoid inheriting orphaned objects and legacy technical debt"
  - "Full domain migration with cleanup — not explicitly discussed; implied to be too costly given accumulated state"
dependents: []
projects: []
---

## Context

Raised by Manal Attalla in the 2026-02-12 IT strategy meeting. Manal is managing the new domain setup and explicitly stated: "I've never wanted to trust them between each other, because I don't want the new domain to get bogged down with all of the orphaned objects."

Karen acknowledged the old domain has accumulated technical debt over time ("you inherited this"). Manal took partial responsibility for historical state but confirmed the approach of keeping the domains isolated.

## Decision

The new domain is not configured to trust the old domain. Migration of applications and services to the new domain proceeds individually (no bulk migration). This keeps the new environment clean.

## Implications

- Each application migrated to the new domain requires individual service account provisioning, GPO review, and testing.
- Users, groups, and objects are created fresh in the new domain — not copied from old.
- Coordination required when applications spanning both domains are in transition.

## Notes

- Context: the design referenced in the meeting (authored by "Zane", described as "still the current design" but "a bit clumsy looking") should be published to the new SharePoint space — action item for Karen Lewin.
- StreamServe runs on the old domain/old DB server — Windows 11 incompatibility makes this a related pressure point (see risk note and ADR-018 implications).
