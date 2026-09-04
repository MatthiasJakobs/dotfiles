# Powerlevel10k overrides for the official Solarized Light palette.
# This file is sourced after ~/.p10k.zsh so it works with any wizard layout.

typeset -g POWERLEVEL9K_DIR_FOREGROUND='#58a6ff'
typeset -g POWERLEVEL9K_DIR_SHORTENED_FOREGROUND='#58a6ff'
typeset -g POWERLEVEL9K_DIR_ANCHOR_FOREGROUND='#58a6ff'
typeset -g POWERLEVEL9K_DIR_ANCHOR_BOLD=false

typeset -g POWERLEVEL9K_VCS_FOREGROUND='#58a6ff'
typeset -g POWERLEVEL9K_VCS_CLEAN_FOREGROUND='#58a6ff'
typeset -g POWERLEVEL9K_VCS_LOADING_FOREGROUND='#58a6ff'
typeset -g POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='#58a6ff'
typeset -g POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='#58a6ff'
typeset -g POWERLEVEL9K_VCS_CONFLICTED_FOREGROUND='#58a6ff'
typeset -g POWERLEVEL9K_VCS_DISABLED_FOREGROUND='#58a6ff'

(( ! $+functions[p10k] )) || p10k reload
