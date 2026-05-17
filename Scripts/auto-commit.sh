#!/usr/bin/env bash

REPO="$HOME/Documents/Notes"

cd "$REPO" || exit 1

# avoid running while earlier push is still in progress
[ -f /tmp/auto-commit.lock ] && exit 1
touch /tmp/auto-commit.lock
trap 'rm -f /tmp/auto-commit.lock' EXIT

if [ -n "$(git status --porcelain)" ]; then
  git pull --rebase --autostash
  git add -A
  git commit -m "auto-commit: $(date '+%Y-%m-%d %H:%M')"
  git push
fi
