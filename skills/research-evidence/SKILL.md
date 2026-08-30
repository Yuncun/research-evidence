---
name: research-evidence
description: Settle claims about what exists, what people use, and what is current, by recent human adoption with counts and dates. Use when asked what people use for X, whether anyone has solved X, or whether X is standard; before building any tool, script, workflow, or skill; and before stating that nothing exists or that only one tool has it.
allowed-tools: Bash(${CLAUDE_SKILL_DIR}/scripts/*)
---

# Research with human evidence

A question is settled in one of three places: by running the code, by asking the user, or by other people. This skill is for the third. Memory is old and doc-shaped; humans are recent and practice-shaped. Stay on the path many people walk, and the burden of correctness is theirs.

## Rules

1. **Recency ranks.** Prefer the last 3 to 4 months; print every source's date; label older material as older and keep it when still cited.
2. **Adoption ranks**, over how well a source argues. Points, comments, reactions, stars, push dates. A one-line answer from the team that builds the tool counts as adoption too.
3. **Cite the counts** with each source.
4. **Building is a claim that nothing fits.** Before building any means (tooling, scripts, workflows, skills, machine fixes), show the search that found nothing, or adopt what it found.
5. **Star-sorted search settles existence.** Awesome lists are long-tail discovery; they miss major repos.

Adoption over argument, the failure this skill exists for:

| wrong | right |
|---|---|
| "this repo's approach is well reasoned" (1 star, README written by an agent) | star-sorted search on the category finds `mattpocock/skills` at 241k stars; cite it |

## Order of search

This skill adds to ordinary search. Step 0 always runs.

0. **Plain web search**, two or three phrasings, no site filter. Catches essays, posts, talks, papers. Note what it returned.
1. **Discourse**: HN, Reddit, X (`site:x.com`), GitHub issues with reactions. Threads name the problem, the tools picked, the rules settled on.
2. **What the discourse names**: stars, push date, instruction files of each tool or repo.
3. **Completeness**: star-sorted GitHub search on the category; large repos' agent instruction files.
4. **Vendor docs and vendor engineers**, in parallel with 1 to 3; newer vendor material overrides community folklore.

Treat counts as claims: stars can be bought and threads seeded. Corroborate a count with the commit history, named users or forks, and discussion outside the project's own channels.

Search the topic, not the framing: counting repos that use one label measures the label. Compare stars like with like: one category's top repo against another's.

## Scripts

All in `${CLAUDE_SKILL_DIR}/scripts/`; each prints usage when run bare.

| Script | Does |
|---|---|
| `hn.sh "<query>" [days] [min_points]` | HN stories by points and date |
| `hn-item.sh <id> [depth]` | one HN story or comment with replies |
| `reddit.sh <subreddit> [title] [days or date] [limit]` | posts ranked by comment count |
| `reddit-thread.sh <post_id>` | one post with its comment tree |
| `x.sh <status_id or handle>` | one X post with engagement, or a profile |
| `gh-stars.sh "<topic>"` or `--owner <user>` | star-sorted repo search |
| `gh-links.sh <owner/repo>` | repos whose README links to it, by stars |
| `agents-md.sh "<term>" [repos...]` | grep large repos' AGENTS.md / CLAUDE.md |
| `gh-issue.sh <owner/repo> <number or query>` | issue reactions and comments |

## References

- `references/access.md`: how each source is reached, what is blocked, wrapper tools checked and why they were passed over.
- `references/sources.md`: dated starting points: subreddits, X accounts, awesome lists, large repos with instruction files.

## Reporting

Applies whenever evidence is cited, including evidence remembered from an earlier turn or from training: say where it came from and how old it is.

Table first: source, type, adoption count, date, one-line takeaway. Then proven by humans versus merely plausible. Say plainly when evidence is thin.

For a build decision: the top existing options with counts and push dates, then one line: adopt X, or build because of the named gap.
