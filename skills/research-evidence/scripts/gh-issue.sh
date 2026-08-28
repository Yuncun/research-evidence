#!/usr/bin/env bash
# Engagement on one GitHub issue, or a repo's issues matching a query sorted by reactions.
# usage: gh-issue.sh <owner/repo> <number>   |   gh-issue.sh <owner/repo> "<query>"
set -euo pipefail
repo="${1:?usage: gh-issue.sh <owner/repo> <number|query>}"; x="${2:?number or query}"
if [[ "$x" =~ ^[0-9]+$ ]]; then
  gh api "repos/$repo/issues/$x" --jq '"reactions=\(.reactions.total_count) comments=\(.comments) created=\(.created_at[:10]) state=\(.state)  \(.title)"'
else
  gh api -X GET search/issues -f q="$x repo:$repo is:issue" -f sort=reactions -f order=desc -f per_page=15 \
    --jq '.items[] | "\(.reactions.total_count)r \(.comments)c \(.created_at[:10]) #\(.number) \(.title[:80])"'
fi
