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

SYSTEM="$(uname)"
if [ "$SYSTEM" = "Darwin" ]
then
    export PATH="/Users/Matthias/Library/Python/3.7/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/share/dotnet:/Library/TeX/texbin:/Users/Matthias/anaconda3/bin"

    # At the moment only setup on mac
    function ec2ssh {
        ssh -i ~/Downloads/ChefkochCrawler.pem ec2-user@$1
    }
else
    # Assuming Linux
    HOSTNAME="$(cat /proc/sys/kernel/hostname)"
    if [ "$HOSTNAME" = "wallace" ]
    then
# source /home/matthias/.anaconda3/etc/profile.d/conda.sh  # commented out by conda initialize
        export PATH=/home/matthias/.local/bin:$PATH
    fi
    if [ "$HOSTNAME" = "athena" ]
    then
        export PATH=/home/matty/bin:$PATH
    fi
    if [ "$HOSTNAME" = "gwkilab" ]
    then
        alias d="./home/jakobs/.docker/securedocker -H s876cnsm:2379"
    fi
    if [ "$HOSTNAME" = "kiosk" ]
    then
        alias matlab=/app/unido-i08/lix86_2.6.64/matlab/2019b/bin/matlab

        __conda_setup="$('/home/jakobs/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
        if [ $? -eq 0 ]; then
            eval "$__conda_setup"
        else
            if [ -f "/home/jakobs/miniconda3/etc/profile.d/conda.sh" ]; then
# . "/home/jakobs/miniconda3/etc/profile.d/conda.sh"  # commented out by conda initialize
            else
# export PATH="/home/jakobs/miniconda3/bin:$PATH"  # commented out by conda initialize
            fi
        fi
        unset __conda_setup
    fi
fi

#RPROMPT='($(echo $ZSH_KUBECTL_CONTEXT | tr "/" "\n" | tail -n1))'

# General aliases
alias e="exit"
alias ta="tmux attach"

alias ga="git add"
alias gc="git commit"
alias gs="git status"

alias k="kubectl"
alias d="docker"

alias jupyter-remote="ssh -CNL localhost:5678:localhost:5678 jakobs@kiosk"
alias pling="paplay /usr/share/sounds/freedesktop/stereo/complete.oga"
alias toot="paplay /home/matty/Documents/clown_short.wav"

cdc () {
    builtin cd $1
}

cd () {
    builtin cd $1
    ls
}

open () {
    xdg-open $1 &
}

rename_git() {
    git remote set-url origin $(git remote -v | grep fetch | awk '{print $2}' | sed "s/matty265/MatthiasJakobs/g")
}

pyenvs(){
    source ~/.pyenvs/$1/bin/activate
}

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/jakobs/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/jakobs/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/jakobs/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/jakobs/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
