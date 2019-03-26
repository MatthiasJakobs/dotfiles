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

if [ ! -e ~/.oh-my-zsh ]
then
    sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
fi

ln -s ~/.dotfiles/vimrc ~/.vimrc
ln -s ~/.dotfiles/vim ~/.vim
ln -s ~/.dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/zshrc ~/.zshrc
