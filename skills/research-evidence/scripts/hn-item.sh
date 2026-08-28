#!/usr/bin/env bash
# One HN story or comment with its reply tree, flattened. No auth.
# usage: hn-item.sh <id> [max_depth=2]
set -euo pipefail
id="${1:?usage: hn-item.sh <id> [max_depth]}"; depth="${2:-2}"
curl -sS -m 20 "https://hn.algolia.com/api/v1/items/$id" | python3 -c "
import sys,json,html,re
d=json.load(sys.stdin)
def clean(t): return re.sub('<[^>]+>',' ',html.unescape(t or '')).strip()
def walk(n,lvl):
    if lvl>$depth: return
    t=clean(n.get('text') or n.get('title') or '')
    if t: print('  '*lvl+f\"[{n.get('author')}|{n.get('points') or ''}] {t[:400]}\")
    for c in n.get('children') or []: walk(c,lvl+1)
walk(d,0)"
