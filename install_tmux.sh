#!/bin/sh
set -e

echo '→ Checking tmux plugin manager'
if [ ! -d "$HOME/.tmux/plugins" ]; then
  echo '  Cloning tpm'
  git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
else
  echo '  tmux plugins directory already exists'
fi

SRC="$(pwd)/tmux"
DST="$HOME/.config/tmux"
BAK="$HOME/.config/tmux.bak"

echo '→ Linking tmux config'
if [ -e "$DST" ] || [ -L "$DST" ]; then
  echo "  Existing config found, backing up to $BAK"
  rm -rf "$BAK"
  mv "$DST" "$BAK"
fi

ln -s "$SRC" "$DST"
echo '✓ Done'
