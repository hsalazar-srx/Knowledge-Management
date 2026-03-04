# /runbook — Operational Knowledge Capture

Capture a deployment experience, incident, or operational procedure as a structured runbook entry in `runbooks/`.

## Instructions

Given a description of a deployment, incident, or procedure, do the following:

1. Determine which runbook to update or create:
   - IIS deployment → `runbooks/iis-deployment.md`
   - Certificate management → `runbooks/certificate-management.md`
   - DB2/AS400 connectivity → `runbooks/db2-as400-connectivity.md`
   - MyInvois submission → `runbooks/myinvois-submission.md`
   - MOVEX M3 connection → `runbooks/movex-m3-connection.md`
   - New procedure → `runbooks/{descriptive-name}.md`
2. If updating: add the new experience to the relevant section
3. If creating: use the template below
4. Link the runbook to any related `decisions/` or `risks/` entries
5. Check if this experience reveals an early warning signal for any existing risk — if so, update the risk

### Runbook Template

```markdown
---
topic: "{Short description}"
category: deployment | incident | procedure | configuration
projects:
  - "{affected project}"
last_updated: {today}
related_decisions: []
related_risks: []
---

## Purpose

{What this runbook covers. When to use it.}

## Prerequisites

- {Required access or tools}
- {Configuration that must be in place}

## Procedure

### Step 1: {Name}

{Instructions}

### Step 2: {Name}

{Instructions}

## Known Issues and Fixes

### Issue: {Description}

**Symptom:** {What you observe}
**Root cause:** {Why it happens}
**Fix:** {How to resolve it}
**Prevention:** {How to avoid it next time}
**Time cost if ignored:** {Estimate}

## Verification

{How to confirm the procedure succeeded}

## Rollback

{How to undo if something goes wrong}
```

## Quality Gates

- Every issue documented includes: symptom, root cause, fix, and prevention
- Time cost is estimated where possible (forces honest assessment of impact)
- Related decisions and risks are linked
- If the runbook reveals a new risk, it must be created in `risks/` before the session ends
- Runbooks are additive — never delete existing issues, only mark them as resolved with the fix
