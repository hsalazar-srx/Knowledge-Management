# /compliance-check — Compliance and Regulatory Review

Cross-reference the vault's compliance section against current LHDN/MyInvois SDK versions, ISO 27001 controls, and decisions that depend on compliance assumptions.

## Instructions

1. List all files in `compliance/`
2. For each file, check:
   - Is `last_reviewed` within the acceptable window (see cadence table below)?
   - For LHDN/MyInvois notes: does `lhdn_sdk_version` match the current known version?
   - Does `affected_decisions` link to all decisions that cite this rule as an assumption?
3. Scan all files in `decisions/` for assumptions that reference compliance topics:
   - LHDN SDK version, MyInvois spec version, ISO 27001 controls, audit log retention
   - Flag any decision whose compliance assumption does not have a corresponding `compliance/` note
4. Check `risks/` for compliance risks:
   - Flag any with `status: active` that relate to LHDN, MyInvois, or ISO 27001
5. Check `projects/` for any project with compliance dependencies:
   - MyInvois-Phase-1, any audit-related work
   - Flag if the project's `go_live` is within 30 days and compliance notes are stale
6. Produce a compliance health report

### Cadence Table

| Category | Review cadence | Flag if stale by |
|----------|---------------|-----------------|
| LHDN / MyInvois | Monthly | > 30 days |
| ISO 27001 | Quarterly | > 90 days |
| Internal compliance | Quarterly | > 90 days |

### LHDN SDK Version Check

Current known LHDN MyInvois SDK versions:
- v1.5 (as of 2026-02-01) — current production
- Check LHDN portal for updates: any note referencing an older version should be flagged

## Output Report Format

```
=== COMPLIANCE CHECK — {date} ===

LHDN / MYINVOIS
  Current SDK version: 1.5
  Notes on current version:  N
  Notes on older versions:   N  → {list filenames} — UPDATE REQUIRED
  Stale notes (>30 days):    N  → {list filenames}

ISO 27001
  Stale notes (>90 days):    N  → {list filenames}

DECISION GAPS
  Decisions with compliance assumptions but no compliance note:
  → {list decision filenames and the missing compliance topic}

ACTIVE COMPLIANCE RISKS
  → {list risk filenames}

PROJECT COMPLIANCE FLAGS
  → {list projects with stale compliance notes near go-live}

RECOMMENDED ACTIONS:
1. {action}
2. {action}
```

Report saved to: `reviews/compliance-check-{YYYY-MM-DD}.md`

## Quality Gates

- All compliance files are checked — no section skipped
- Every decision with a compliance assumption is verified against `compliance/`
- SDK version mismatches are flagged, not silently noted
- Report is saved before ending the skill
