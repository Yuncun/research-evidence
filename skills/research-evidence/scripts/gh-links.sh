#!/usr/bin/env bash
# Reverse lookup: repos whose README links to owner/repo, ranked by stars.
# Finds which lists actually track a project. Uses the `filename:` qualifier
# (the `path:` qualifier returns 0 on this endpoint).
# usage: gh-links.sh <owner/repo> [limit=30]
set -euo pipefail
target="${1:?usage: gh-links.sh <owner/repo> [limit]}"; limit="${2:-30}"
gh api -X GET search/code -f q="\"$target\" filename:README.md" -f per_page=100 \
  --jq '.items[].repository.full_name' | sort -u | while read -r r; do
  printf "%s\t%s\n" "$(gh api "repos/$r" --jq .stargazers_count 2>/dev/null || echo 0)" "$r"
done | sort -rn | head -n "$limit"
