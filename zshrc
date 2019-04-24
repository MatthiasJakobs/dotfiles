ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="muse"

plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

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
        source /home/matthias/.anaconda3/etc/profile.d/conda.sh
    fi
fi

# General aliases
alias e="exit"
alias ta="tmux attach"

alias ga="git add"
alias gc="git commit"
alias gs="git status"
