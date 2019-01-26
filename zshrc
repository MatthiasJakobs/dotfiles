ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="muse"

plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

HOSTNAME="$(cat /proc/sys/kernel/hostname)"
if [ "$HOSTNAME" = "wallace" ]
then
    source /home/matthias/.anaconda3/etc/profile.d/conda.sh
fi
