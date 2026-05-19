#!/usr/bin/env bash
# Upload your exact slides (presentation-edits.json) to the public share link.
set -e
cd "$(dirname "$0")"

if [[ ! -f presentation-edits.json ]]; then
  echo "Missing presentation-edits.json"
  echo "In the browser, open your deck and click Share my version first."
  exit 1
fi

git add presentation-edits.json
git diff --cached --quiet && echo "No changes in presentation-edits.json — run Share my version in the browser first." && exit 1

git commit -m "Publish presentation edits for share link"
git push

echo ""
echo "Share this link (your exact slides):"
echo "https://wnorton26-sketch.github.io/repuck-hockey-presentation/"
