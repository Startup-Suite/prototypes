#!/bin/sh
# Stamp every page with the current UTC minute so you can tell at a glance
# which build a tab is showing. Run this before committing.
set -e
cd "$(dirname "$0")"
STAMP=$(date -u '+%Y-%m-%d %H:%M UTC')
for f in index.html meetings/*.html; do
  [ -f "$f" ] || continue
  perl -0pi -e "s/(<span class=\"build\" data-build>|<div class=\"build\" data-build>)build [^<]*/\${1}build $STAMP/g" "$f"
done
echo "stamped: $STAMP"
