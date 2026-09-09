---
name: research-evidence
description: Use when the user asks for prior art, existing alternatives, build-versus-adopt advice, or evidence of adoption or effectiveness. Not for explaining documentation or local code, troubleshooting, or implementing a choice already made; mentioning agents or tooling alone is not a trigger.
---

# Prior art and adoption evidence

Help decide whether an existing approach fits before recommending one or building something new.

## Scope

Apply this only to the part of the request asking about alternatives, prior art, adoption, or effectiveness. A request to use this skill explicitly also qualifies.

| Request | Action |
|---|---|
| "Should I build a log viewer or use an existing one?" | Compare existing options |
| "Do people still use this workflow with newer models?" | Find dated usage and effectiveness evidence |
| "Add JSON output to our existing log viewer" | Implement the settled choice; no adoption study |
| "Explain this agent's configuration" | Read its files or official documentation |

## Research

1. Identify the decision and constraints. Use available web search and `gh` to discover relevant options; start broad enough to find approaches with different names.
2. Read the primary sources: maintained repositories, official documentation, and dated first-hand discussions. Open the sources that support the recommendation; a search summary is not evidence.
3. For each serious option, record fit, maintenance activity, source date, and adoption counts where useful. Date the observation of changing counts.
4. Separate **usage** from **effectiveness**. Stars and reactions help discover options; they do not prove quality, active use, or benefits for a particular model. Prefer direct comparisons for those claims.
5. Stop when the decision is supported, or state the evidence gap. A failed request or an empty helper response does not establish that nothing exists.

Use the sources appropriate to the question, not a mandatory tour of HN, Reddit, X, and GitHub. Older evidence can still establish a fact; label its age rather than discarding it.

## Output

Lead with the recommendation. For a comparison, use a compact table: option, fit, evidence date, and limitation. Cite the primary sources and say what remains unknown. Keep an adoption count only when it helps the decision.

## Optional resources

Prefer the available search/browser tools and official `gh` CLI. Legacy `scripts/` helpers are optional, not a required execution path. Read `references/access.md` before using them: several hide upstream failures. `references/sources.md` contains dated discovery starting points, not current recommendations.
