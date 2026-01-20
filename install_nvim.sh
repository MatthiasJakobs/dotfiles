#!/bin/sh
set -e

SRC="$(pwd)/nvim"
DST="$HOME/.config/nvim"
BAK="$HOME/.config/nvim.bak"

echo '→ Linking Neovim config'

if [ -e "$DST" ] || [ -L "$DST" ]; then
  echo "  Existing config found, backing up to $BAK"
  rm -rf "$BAK"
  mv "$DST" "$BAK"
fi

ln -s "$SRC" "$DST"

echo '✓ Neovim config linked'
