#!/bin/sh
set -e

SRC="$(pwd)/zshrc"
DST="$HOME/.zshrc"
BAK="$HOME/.zshrc.bak"

echo '→ Linking zshrc'

if [ -e "$DST" ] || [ -L "$DST" ]; then
  echo "  Existing zshrc found, backing up to $BAK"
  rm -f "$BAK"
  mv "$DST" "$BAK"
fi

ln -s "$SRC" "$DST"

echo '→ Ensuring zsh plugins directory'
mkdir -p "$HOME/.config/zsh/plugins"

PLUGIN="$HOME/.config/zsh/plugins/zsh-syntax-highlighting"

if [ ! -d "$PLUGIN" ]; then
  echo '  Cloning zsh-syntax-highlighting'
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$PLUGIN"
else
  echo '  zsh-syntax-highlighting already present'
fi

echo '✓ zsh setup complete'

