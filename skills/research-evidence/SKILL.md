---
name: research-evidence
description: Research what people actually use, ranked by recent adoption with counts and dates. Use when asked what people use, whether anyone has solved something, or whether something is standard; before building something many people would also need; and before saying that nothing exists.
allowed-tools: Bash(scripts/*)
---

# Research with human evidence

Use this when the answer depends on what other people do, not on code you can run or on the user's own preference. Recent adoption, with numbers, beats a well-argued source and beats memory.

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
1. **Venue**: name who has this problem as a job or hobby, pick two or three subreddits those people use (`subs.sh <word>` lists names by size), and probe each with `reddit.sh <sub> "<problem words>"`; keep the ones that return threads with ranked replies. Nothing searches Reddit across subreddits, so candidates come from that judgment and from `references/sources.md`. HN and GitHub are venues only when the answer is a developer tool.
2. **Discourse** in those venues: Reddit, HN, X (`site:x.com`), GitHub issues with reactions. Threads name the problem, the tools picked, the rules settled on.
3. **What the discourse names**: stars, push date, instruction files of each tool or repo, looked up by name.
4. **Completeness**: star-sorted GitHub search on the category; large repos' agent instruction files.
5. **Vendor docs and vendor engineers**, in parallel with 2 to 4; newer vendor material overrides community folklore.

Treat counts as claims: stars can be bought and threads seeded. Corroborate a count with the commit history, named users or forks, and discussion outside the project's own channels.

A venue counts when wrong answers get corrected there: replies disagree, and the disagreement is ranked. A thread whose replies are all product plugs with no dissent is discounted, whatever its subreddit.

| wrong | right |
|---|---|
| photo prints to digitize: r/scanning, r/genealogy, r/DataHoarder, HN probed, named after the object; all empty | the people who do it are photographers: r/AskPhotography, probed first, holds the threads |
| eight replies each naming a different VPN, none answering another: cited as consensus | cited as unranked plugs; weight the thread where a 9-point reply corrected a 3-point one |

Search the topic, not the framing: counting repos that use one label measures the label. Compare stars like with like: one category's top repo against another's.

## Queries

Open with a short query, under five words, in the asker's words; then query by the names the first results mention. The category word is rarely the tool's name: two people pick the same term for one thing under 20% of the time (Furnas et al. 1987, 1,735 citations), so a name lookup finds what a category search misses.

| wrong | right |
|---|---|
| `gh-stars.sh "instagram downloader"` lists 15 repos; gallery-dl (19.7k stars) and instaloader (13.4k) are not among them | `reddit.sh DataHoarder "instagram"` threads name both; `gh api repos/mikf/gallery-dl` gives the count |
| four phrasings of `gh-stars.sh "go retry http"`, all empty, before any thread was read | one `reddit.sh golang "retry"` thread names the libraries; `gh api repos/<owner>/<name>` counts each |

## Scripts

All in `scripts/`; each prints usage when run bare.

| Script | Does |
|---|---|
| `hn.sh "<query>" [days] [min_points]` | HN stories by points and date |
| `hn-item.sh <id> [depth]` | one HN story or comment with replies |
| `subs.sh <name prefix> [limit]` | subreddits by subscribers, to pick venues |
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
