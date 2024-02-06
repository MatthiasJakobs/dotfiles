ZSH="$HOME/.oh-my-zsh"
#ZSH_THEME="af-magic"
ZSH_THEME="robbyrussell"

plugins=(
  git
  ssh-agent
  vi-mode
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
#source $HOME/.dotfiles/zsh-kubectl-prompt/kubectl.zsh

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# General aliases
alias e="exit"
alias ta="tmux attach"

alias ga="git add"
alias gc="git commit"
alias gs="git status"

alias k="kubectl"
alias d="docker"

alias pling="paplay /usr/share/sounds/freedesktop/stereo/complete.oga"
alias toot="paplay /home/matty/Documents/clown_short.wav"

cdc () {
    builtin cd $1
}

cd () {
    builtin cd $1
    ls
}

pyenvs(){
    source ~/.pyenvs/$1/bin/activate
}
source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
source /opt/homebrew/opt/chruby/share/chruby/auto.sh
chruby ruby-3.1.3

pyenvs main
