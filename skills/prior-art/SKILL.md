---
name: prior-art
description: Use when introducing a new software tool, dependency, automation, agent skill, or engineering workflow before implementation; or assessing these options' alternatives, provenance, maintenance, adoption, or effectiveness. Includes requests to build a custom tool without an earlier build-versus-adopt decision. Excludes routine edits, debugging, explanations, implementation of a settled choice, general news, and nontechnical questions.
---

# Prior art

Check what already solves an engineering need before adding something new to maintain.

## Scope

Apply this to software tools and engineering workflows, including the tooling an agent proposes on its own. A request to build a tool is a trigger even without an explicit request for alternatives.

| Request | Action |
|---|---|
| "Build a reusable CI log viewer" | Check existing solutions first |
| "Add JSON output to our existing log viewer" | Implement the change directly |

Reuse an earlier build-versus-adopt decision when the constraints still hold. Scope a mixed request to its engineering decision; ordinary factual questions use ordinary research.

## Before building or recommending

1. Identify the unmet need and constraints. Check the repository's existing components and the platform's built-in capabilities. Search for how people solve the same problem, not just tools matching the proposed implementation.
2. Use relevant community discussions to discover overlooked options, then verify serious candidates against primary sources. Compare fit and maintenance with dated evidence of real use.
3. Recommend reuse, adoption, or a custom implementation. For custom work, name the concrete constraint the existing options miss, including dependency or operating cost. Keep the search proportionate; stop once there is enough evidence for the decision.

## Evidence

- Date maintenance and adoption observations. Prefer evidence relevant to current versions; older evidence can still establish a fact.
- Popularity helps discover options. Named users and first-hand usage reports support adoption; stars alone establish neither active use nor effectiveness on a particular model.
- A search summary is a lead, not a verified source. Failed access or an empty helper result leaves a gap; it does not show that no solution exists.

## Answer

Lead with the decision and why the strongest existing option fits or falls short. Cite the dated evidence and state any material gap. Use a short comparison only when multiple candidates matter. Continue the authorized task once the choice is supported.
