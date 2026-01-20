#!/bin/sh
set -e

SRC="$(pwd)/git"
DST="$HOME/.config/git"
BAK="$HOME/.config/git.bak"

echo '→ Linking git config'

if [ -e "$DST" ] || [ -L "$DST" ]; then
  echo "  Existing git config found, backing up to $BAK"
  rm -rf "$BAK"
  mv "$DST" "$BAK"
fi

ln -s "$SRC" "$DST"

echo '✓ Git config linked'

