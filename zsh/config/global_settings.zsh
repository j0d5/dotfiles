# shellcheck shell=bash
# {{{
#
# Author: Johannes Steudle
# File: global_settings.zsh
#
# Description: file for global settings
#
# }}}

DEFAULT_USER=$(whoami)
export DEFAULT_USER

setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt promptsubst

#setopt no_beep
setopt auto_cd
setopt multios
setopt cdablevars

export TERM="xterm-256color"
SHELL=$(which zsh)
export SHELL

# History search settings
export HISTORY_SUBSTRING_SEARCH_GLOBBING_FLAGS=i
export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='bg=magenta,fg=white,bold'
export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='bg=red,fg=white'

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# Autosuggestion settings
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8"
