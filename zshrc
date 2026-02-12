zmodload zsh/complist
autoload -U compinit && compinit 
autoload -U colors && colors

# cmp opts
zstyle ':completion:*' menu select
zstyle ':completion:*' special-dirs true

# main opts
setopt auto_menu #menu_complete
setopt no_case_glob no_case_match
setopt nocaseglob

HISTFILE=~/.zsh_history
HISTSIZE=10000000
SAVEHIST=10000000
setopt appendhistory

source <(fzf --zsh)

#### Aliases and other things ####
if command -v eza >/dev/null 2>&1; then
  alias ls='eza -l --icons --color=auto'
  alias ll='eza -lah --icons --color=auto'
else
  alias ls='ls --color=auto'
  alias ll='ls -lah --color=auto'
fi


#### Vim stuff ####
bindkey -v

#### Git ####
autoload -Uz vcs_info
zstyle ':vcs_info:git:*' formats ' %b'

#### Python venvs ####
export VIRTUAL_ENV_DISABLE_PROMPT=1
function venv_prompt {
  [[ -n $VIRTUAL_ENV ]] && echo " ${VIRTUAL_ENV:t}"
}

pyenvs(){
    source ~/.pyenvs/$1/bin/activate
}

#pyenvs main

#### SSH AGENT  ####
# Pick a stable per-user runtime dir (systemd sets XDG_RUNTIME_DIR; otherwise fall back)
: ${XDG_RUNTIME_DIR:="/tmp/${UID}-runtime"}
mkdir -p "$XDG_RUNTIME_DIR"

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.sock"

# If no agent is listening on the socket, start one bound to that socket
if ! ssh-add -l >/dev/null 2>&1; then
  # kill stale socket file if present
  [[ -S "$SSH_AUTH_SOCK" ]] || rm -f "$SSH_AUTH_SOCK"

  # Start agent attached to our chosen socket; suppress output
  eval "$(ssh-agent -a "$SSH_AUTH_SOCK" -s)" >/dev/null

  if [[ -t 0 ]]; then
    ssh-add
  fi

fi

#### ZOXIDE ####
if which zoxide >/dev/null 2>&1; then
    eval "$(zoxide init zsh)"
fi

##### Load plugins ####
source ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

##### Prompt ####
function precmd {
  vcs_info
  print -rP ''
}

setopt PROMPT_SUBST
NEWLINE=$'\n'
PROMPT='%F{red}%n$f %F{blue}%~%f %F{magenta}${vcs_info_msg_0_}%f %F{yellow}$(venv_prompt)%f${NEWLINE}%F{green}❯%f '
