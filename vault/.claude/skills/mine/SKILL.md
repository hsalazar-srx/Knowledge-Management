# /mine — Transcript Mining

Extract decisions, project updates, risks, M3 knowledge, vendor signals, and action items from meeting transcripts. Route each to the correct vault location.

## Instructions

1. Read the full transcript without skipping any section
2. Identify every thread of discussion:
   - Architecture or process decisions
   - Project status updates and blockers
   - Risk signals and early warnings
   - M3 / MOVEX transaction knowledge or quirks mentioned
   - LHDN / MyInvois compliance updates
   - Vendor news or signals (Infor, Microsoft, LHDN portal)
   - Action items assigned to individuals
   - Strategy shifts or contradictions with existing strategy
3. For each **decision**:
   - Create an atomic note in `decisions/` with proposition filename
   - Include: `assumptions`, `alternatives`, `reversibility`, `review_date`, `projects`
   - Link to any existing decisions it supersedes or depends on
   - Classify as type-1-irreversible or type-2-reversible
4. For each **project update**:
   - Update the corresponding note in `projects/`
   - Update `status`, `phase`, `open_risks` as needed
5. For each **risk signal**:
   - Check if a matching risk exists in `risks/`
   - If yes: add signal to the risk's signal log and update `reviewed` date
   - If no: create a new risk note with full schema
6. For each **M3 / MOVEX knowledge item**:
   - Update or create note in `m3-knowledge/transactions/` or `m3-knowledge/tables/`
   - Always record `known_quirks` if a problem was mentioned
7. For each **compliance update**:
   - Update or create note in `compliance/`
   - Note LHDN SDK version if mentioned
   - Flag dependent decisions in `decisions/`
8. For each **vendor signal**:
   - Update entity profile in `vendors/`
   - Add to signal log with date, source, and assessed impact
9. For each **strategy shift**:
   - Check `strategy/` for the relevant claim
   - If it contradicts documented strategy: surface explicitly in the mining report
   - Do not silently absorb contradictions
10. Create a meeting summary in `archive/` using filename `YYYY-MM-DD-{meeting-topic}.md`
11. Move the raw transcript from `transcripts/` to `archive/transcripts/`

## Output Report Format

After mining, print a summary:

```
Mining complete: {transcript filename}

Decisions:        N → decisions/
Project updates:  N → projects/
Risk signals:     N → risks/
M3 knowledge:     N → m3-knowledge/
Compliance notes: N → compliance/
Vendor signals:   N → vendors/
Strategy flags:   N → review required
Action items:     N → (listed below)
Meeting summary:  archive/{filename}

Action items:
- [Owner] Action description
```

## Quality Gates

- Every extracted decision has a non-empty `assumptions` field
- Every risk signal either updates an existing risk or creates a new risk note
- Strategy contradictions are surfaced, not absorbed
- M3 knowledge items always include `known_quirks` (even if "none observed yet")
- Compliance updates include `lhdn_sdk_version` for any LHDN-related content
- Zero information loss: if it was discussed, it was extracted or explicitly marked as not actionable
- The raw transcript is moved to `archive/` after mining — `transcripts/` stays clean
