#!/usr/bin/env bash
# Grep large repos' agent instruction files (AGENTS.md, CLAUDE.md,
# copilot-instructions) for a term: evidence of what rules real teams adopted.
# usage: agents-md.sh "<term>" [owner/repo ...]   (default: a fixed set of large repos)
set -uo pipefail
term="${1:?usage: agents-md.sh \"<term>\" [owner/repo ...]}"; shift
repos=("$@"); [ ${#repos[@]} -eq 0 ] && repos=(oven-sh/bun zed-industries/zed grafana/grafana n8n-io/n8n openai/codex vercel/next.js denoland/deno astral-sh/uv posthog/posthog google-gemini/gemini-cli)
for r in "${repos[@]}"; do
  for f in AGENTS.md CLAUDE.md .github/copilot-instructions.md; do
    out=$(gh api "repos/$r/contents/$f" --jq .content 2>/dev/null | base64 -d 2>/dev/null | grep -in -- "$term" | head -5)
    [ -n "$out" ] && { echo "== $r/$f ($(gh api "repos/$r" --jq .stargazers_count 2>/dev/null) stars)"; echo "$out"; }
  done
done
