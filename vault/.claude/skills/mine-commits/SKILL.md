# /mine-commits — Commit Event Mining

Process pending git commit events from `transcripts/commits/pending/` and update the vault to reflect what changed in the codebase.

## Instructions

1. List all files in `transcripts/commits/pending/` with `status: pending`
2. Sort by `date` ascending (process oldest first)
3. For each commit event, apply the routing rules below
4. After processing all events, mark each as `status: mined`
5. Print a summary report

### Routing Rules by Conventional Commit Type

**`feat:` — New capability added**
- Update `projects/{source}.md`: add the feature to the current phase description
- Check if any `assumptions` in `decisions/` are affected by the new capability
- If the feature touches compliance logic: check `compliance/` for relevant notes

**`fix:` — Bug corrected**
- Check `decisions/` for any decision that assumed the broken behaviour was correct
- If found: flag decision for review and add note: "fix commit {hash} on {date} suggests this assumption may have been wrong"
- Check `risks/` for any risk whose `early_warnings` include the pattern of this bug
- If found: update the risk's signal log

**`adr:` or `docs:` with "ADR-" in message**
- Extract the ADR number from the commit message
- Create or update the corresponding ADR note in `decisions/`
- Apply the full decision schema

**`refactor:`**
- Check `decisions/` for architecture decisions related to the changed files
- Flag any decisions that describe the old structure as still current

**`chore:` touching package files (*.csproj, package.json, packages.lock)**
- Check `vendors/` for any vendor matching the updated package publisher
- If found: add signal to vendor profile

**`chore:` or `feat:` touching `appsettings*.json`**
- Check `decisions/` for configuration management decisions
- Flag if a value changed that was cited as an assumption

**Any commit touching LHDN / MyInvois files**
- Check `compliance/` for the relevant compliance notes
- Update `last_reviewed` on affected compliance notes
- Flag decisions in `decisions/` that depend on those compliance rules

**Any commit touching M3/MOVEX integration files**
(files matching: `*M3*`, `*Movex*`, `*m3*`, `transactions/*.json`, `*MI.cs`)
- Check `m3-knowledge/transactions/` for the relevant program
- If the commit mentions a field name or program, update or flag the m3-knowledge note

### Drift Detection

After processing all commits, check:
- Are `feat:` commits consistently touching areas NOT mentioned in `strategy/`?
- Are there `fix:` commits revealing assumptions that appear in multiple decisions?

Surface any drift signals in the report.

## Output Report Format

```
Commit mining complete. Processed {N} events.

Project updates:      N commits → projects/
Flagged decisions:    N decisions flagged for review
Risk signals added:   N signals → risks/
Compliance flags:     N notes updated → compliance/
M3 knowledge:         N notes updated → m3-knowledge/
Vendor signals:       N signals → vendors/
Drift signals:        N (listed below)

Drift signals:
- {description}

All {N} events marked status: mined.
```

## Quality Gates

- Every pending event is processed before marking complete
- No event is silently skipped — if routing is ambiguous, note it in the report
- Flagged decisions are updated with a `review_note:` field explaining why
- All processed events end with `status: mined` (never delete them)
- Drift signals are surfaced, not absorbed
