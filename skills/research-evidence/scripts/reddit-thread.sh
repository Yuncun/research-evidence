#!/usr/bin/env bash
# One Reddit post with its comment tree, from the Arctic Shift archive.
# usage: reddit-thread.sh <post_id>   (the segment after /comments/ in the URL)
set -euo pipefail
id="${1:?usage: reddit-thread.sh <post_id>}"; UA="Mozilla/5.0"
curl -sS -m 25 -A "$UA" "https://arctic-shift.photon-reddit.com/api/posts/ids?ids=$id" | python3 -c '
import sys,json
try: p=(json.load(sys.stdin).get("data") or [{}])[0]
except Exception: p={}
sub=p.get("subreddit"); au=p.get("author"); nc=p.get("num_comments"); title=p.get("title"); body=(p.get("selftext") or "")[:1500]
print(f"r/{sub} | {au} | {nc} comments")
print(f"# {title}")
print(body); print("---")'
curl -sS -m 25 -A "$UA" "https://arctic-shift.photon-reddit.com/api/comments/tree?link_id=$id&limit=500" | python3 -c '
import sys,json
try: nodes=json.load(sys.stdin).get("data") or []
except Exception: nodes=[]
def walk(ns,d=0):
    for n in ns:
        c=n.get("data",n); au=c.get("author"); sc=c.get("score",0); body=(c.get("body") or "")[:500]
        if body: print("  "*d+f"[{au}|{sc}] {body}")
        walk(c.get("replies") or [],d+1)
walk(nodes)'
