#!/bin/sh
set -e

echo '→ Running git setup'
chmod +x install_git.sh
./install_git.sh

echo '→ Running zsh setup'
chmod +x install_zsh.sh
./install_zsh.sh

echo '→ Running tmux setup'
chmod +x install_tmux.sh
./install_tmux.sh

echo '→ Running neovim setup'
chmod +x install_nvim.sh
./install_nvim.sh

echo '✓ All installations completed'
