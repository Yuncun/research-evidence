#!/usr/bin/env bash
# Star-sorted GitHub repo search, or an author's top repos. Needs `gh` logged in.
# usage: gh-stars.sh "<topic>" [limit=15]      |  gh-stars.sh --owner <user> [limit=5]
# output: stars  pushed  full_name
set -euo pipefail
if [ "${1:-}" = "--owner" ]; then
  gh search repos --owner "${2:?owner}" --sort stars --limit "${3:-5}" --json fullName,stargazersCount,pushedAt \
    --jq '.[] | "\(.stargazersCount)\t\(.pushedAt[:10])\t\(.fullName)"'
else
  gh search repos "${1:?usage: gh-stars.sh \"<topic>\" [limit]}" --sort stars --limit "${2:-15}" --json fullName,stargazersCount,pushedAt \
    --jq '.[] | "\(.stargazersCount)\t\(.pushedAt[:10])\t\(.fullName)"'
fi
