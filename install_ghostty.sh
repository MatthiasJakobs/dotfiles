#!/bin/sh
set -e

SRC="$(pwd)/ghostty"
DST="$HOME/.config/ghostty"
BAK="$HOME/.config/ghostty.bak"

echo '→ Linking ghostty config'
if [ -e "$DST" ] || [ -L "$DST" ]; then
  echo "  Existing config found, backing up to $BAK"
  rm -rf "$BAK"
  mv "$DST" "$BAK"
fi

ln -s "$SRC" "$DST"
echo '✓ Done'
