# Generator: Architecture Decision Records

Create `docs/decisions/001-initial-architecture.md` from the architecture conversation.

---

## Format

```markdown
# ADR 001: Initial Architecture

**Date:** {YYYY-MM-DD}
**Status:** Accepted
**Context:** New {type} project — {description}

## Decisions

### {Topic 1: e.g., Language & Framework}

**Chosen:** {decision}
**Alternatives considered:**
- {alternative 1} — {why rejected}
- {alternative 2} — {why rejected}
**Rationale:** {why this was chosen, including user's reasoning}

### {Topic 2: e.g., Database}

**Chosen:** {decision}
**Alternatives considered:**
- {alternative 1} — {why rejected}
**Rationale:** {reasoning}

{... one section per architecture decision ...}

## Additional Services

{List any services added from the discovery scan, with rationale}

## Consequences

- {Positive consequence 1}
- {Positive consequence 2}
- {Risk or trade-off 1}
- {Things to revisit later}
```

## Rules

- **One section per decision.** Don't combine topics.
- **Include user's reasoning.** If the user said "I want Postgres because I know SQL," record that.
- **Record what was rejected and why.** Future-you will thank present-you.
- **Be honest about trade-offs.** Every decision has downsides. Name them.
- **Date it.** ADRs are time-stamped. Decisions can be revisited.
