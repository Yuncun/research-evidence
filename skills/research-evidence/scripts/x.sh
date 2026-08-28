#!/usr/bin/env bash
# Read one X post (engagement, text, attached article) or a profile via the
# public fxtwitter API. No auth. Discovery is separate: WebSearch "site:x.com <topic>".
# usage: x.sh <status_id | handle>
set -euo pipefail
arg="${1:?usage: x.sh <status_id|handle>}"
if [[ "$arg" =~ ^[0-9]+$ ]]; then
  curl -sS -m 20 -A "Mozilla/5.0" "https://api.fxtwitter.com/status/$arg" | python3 -c '
import sys,json
try: d=json.load(sys.stdin).get("tweet") or {}
except Exception: d={}
a=d.get("author") or {}
sn=a.get("screen_name"); fo=a.get("followers"); li=d.get("likes"); vi=d.get("views"); re=d.get("replies"); dt=str(d.get("created_at"))[:16]
print(f"@{sn} ({fo} followers) likes={li} views={vi} replies={re} {dt}")
print(d.get("text",""))
art=d.get("article")
if art:
    print(); print("--- article:", art.get("title"))
    for b in art.get("content",{}).get("blocks",[]):
        if b.get("text"): print(b["text"])'
else
  curl -sS -m 20 -A "Mozilla/5.0" "https://api.fxtwitter.com/$arg" | python3 -c '
import sys,json
try: u=json.load(sys.stdin).get("user") or {}
except Exception: u={}
sn=u.get("screen_name"); nm=u.get("name"); fo=u.get("followers"); tw=u.get("tweets")
print(f"@{sn} {nm} followers={fo} tweets={tw}")
print(u.get("description",""))'
fi
