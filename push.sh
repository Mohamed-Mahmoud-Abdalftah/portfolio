#!/bin/bash
# Run once from Terminal (after GitHub login):
#   cd /Users/mohamed/Game/portfolio-github && ./push.sh

set -e
cd "$(dirname "$0")"

if ! git rev-parse --git-dir >/dev/null 2>&1; then
  git init
  git branch -M main
fi

git add index.html og.svg README.md .nojekyll .gitignore .github
git commit -m "Update portfolio" 2>/dev/null || true

if ! git remote get-url origin >/dev/null 2>&1; then
  git remote add origin https://github.com/Mohamed-Mahmoud-Abdalftah/portfolio.git
fi

echo "Pushing to GitHub..."
git push -u origin main

echo ""
echo "Done. Enable Pages (one time):"
echo "  https://github.com/Mohamed-Mahmoud-Abdalftah/portfolio/settings/pages"
echo "  Source: GitHub Actions"
echo ""
echo "Live URL: https://mohamed-mahmoud-abdalftah.github.io/portfolio/"
