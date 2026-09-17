# Source notes

Starting points, not rules. Dated; re-measure when they feel stale.

## Venue by problem (measured 2026-09-16)

Probed with `reddit.sh <sub> "<problem words>"`; a venue is listed once its threads carried ranked, dissenting replies. Add a row when a session measures a new one.

| Problem | Venue | Empty on the same query |
|---|---|---|
| Bulk-download or archive a site or account | r/DataHoarder | HN; GitHub category search missed the top tools |
| Digitize photo prints at home | r/AskPhotography | r/scanning, r/genealogy, r/DataHoarder, HN |
| AI coding agents | r/ClaudeCode, X (below) | |

## Subreddits for AI coding-agent questions (measured 2026-08-27)

Ranked by post volume and by sampling 40 recent titles for signal.

| Subreddit | Signal |
|---|---|
| r/ClaudeCode | Best. Workflow, CLAUDE.md, plugins, model behavior; some usage-limit noise |
| r/ExperiencedDevs | Low volume, skeptical senior engineers, highest per-post engagement |
| r/ClaudeAI | High volume, mixed consumer and dev |
| r/codex | Competitor mirror of the same problems |
| r/cursor | Cursor-specific, same agent-behavior issues |
| r/vibecoding, r/AI_Agents | Low signal |

## X accounts that settle Claude Code questions (2026-08-28)

@bcherny (Claude Code creator), @trq212 (Anthropic, Claude Code), @karpathy,
@mattpocock, @simonw. A reply from a vendor engineer with 100 likes can
outweigh a viral thread.

## Awesome lists (2026-08-27)

Long-tail discovery only. Verified miss: mattpocock/skills at 239k stars was
absent from every list below.

- hesreallyhim/awesome-claude-code (pushed daily)
- ComposioHQ/awesome-claude-skills
- VoltAgent/awesome-claude-code-subagents
- e2b-dev/awesome-ai-agents
- sindresorhus/awesome (root index)

## Large repos with agent instruction files worth grepping (2026-08-27)

oven-sh/bun, zed-industries/zed, grafana/grafana, n8n-io/n8n, openai/codex,
vercel/next.js, denoland/deno, astral-sh/uv, posthog/posthog,
google-gemini/gemini-cli. Bun, Zed, Grafana and n8n carry explicit
code-comment rules; the rest do not.
