#!/bin/bash

if [ -e ~/.vimrc ]
then
    echo "~/.vimrc already exists, moving to ~/.vimrc.bak"
    mv ~/.vimrc ~/.vimrc.bak
fi

if [ -e ~/.vim ]
then
    echo "~/.vim already exists, moving to ~/.vim.bak"
    mv ~/.vim ~/.vim.bak
fi

if [ -e ~/.config/nvim ]
then
    echo "~/.config/nvim already exists, moving to ~/.nvim.bak"
    mv ~/.config/nvim ~/.nvim.bak
fi

if [ -e ~/.tmux.conf ]
then
    echo "~/.tmux.conf already exists, moving to ~/.tmux.conf.bak"
    mv ~/.tmux.conf ~/.tmux.conf.bak
fi

if [ -e ~/.zshrc ]
then
    echo "~/.zshrc already exists, moving to ~/.zshrc.bak"
    mv ~/.zshrc ~/.zshrc.bak
fi

if [ ! -e ~/.config/alacritty ]
then
    mkdir ~/.config/alacritty
fi

if [ -e ~/.config/alacritty/alacritty.toml ]
  then
    echo "~/.config/alacritty/alacritty.toml config already exists, moving to ~/.config/alacritty/alacritty.toml.bak"
    mv ~/.config/alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml.bak
fi

if [ ! -e ~/.oh-my-zsh ]
then
    sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
fi

if [ -e ~/.config/neomutt ]
then
    echo "~/.config/neomutt config already exists, moving to ~/.config/neomutt.bak"
    mv ~/.config/neomutt/ ~/.config/neomutt.bak
fi

ln -s ~/.dotfiles/vimrc ~/.vimrc
ln -s ~/.dotfiles/vim ~/.vim
ln -s ~/.dotfiles/nvim ~/.config/nvim
ln -s ~/.dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/zshrc ~/.zshrc
ln -s ~/.dotfiles/alacritty.yml ~/.config/alacritty/alacritty.yml
ln -s ~/.dotfiles/emacs/init.el ~/.emacs.d/init.el
ln -s ~/.dotfiles/neomutt/ ~/.config/neomutt

# Install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --key-bindings --completion --no-update-rc --no-bash --no-fish

# Install Plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
