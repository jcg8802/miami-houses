#!/bin/bash
set -e
REPO_DIR="/Users/glancy/.openclaw/workspace/miami-houses"
DATA_DIR="/Users/glancy/.openclaw/workspace/data"

if [ -f "$DATA_DIR/miami-houses-app.html" ]; then
  cp "$DATA_DIR/miami-houses-app.html" "$REPO_DIR/index.html"
fi

if [ -f "$DATA_DIR/miami-listings-db.json" ]; then
  cp "$DATA_DIR/miami-listings-db.json" "$REPO_DIR/listings-db.json"
fi

cd "$REPO_DIR"
git config user.name "JClaw"
git config user.email "jclaw@candosa.com"
git add -A

if git diff --cached --quiet; then
  echo "No changes to deploy"
else
  git commit -m "Daily update — $(date '+%Y-%m-%d %H:%M')"
  git push origin main
  echo "Deployed to https://jcg8802.github.io/miami-houses/"
fi
