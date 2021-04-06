# {{{
#
# Author: Johannes Steudle
# File: global_settings.zsh
#
# Description: file for global settings
#
# }}}

if [[ -n $DEBUG_ZSH ]]; then
 echo "loading global_settings"
fi

export DEFAULT_USER=$(whoami)

setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt promptsubst

#setopt no_beep
setopt auto_cd
setopt multios
setopt cdablevars

export TERM="xterm-256color"
export SHELL=$(which zsh)

# History search settings
export HISTORY_SUBSTRING_SEARCH_GLOBBING_FLAGS=i
export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='bg=magenta,fg=white,bold'
export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='bg=red,fg=white'

# Autosuggestion settings
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8"

