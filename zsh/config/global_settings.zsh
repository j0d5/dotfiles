##################################################
##                                              ##
## Author: Johannes Steudle                     ##
## File: global_settings.zsh                    ##
## Date: 03.12.2015                             ##
##                                              ##
## Description: file for global settings        ##
##                                              ##
##################################################

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

# bind UP and DOWN arrow keys
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# bind k and j for VI mode
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# Autosuggestion settings
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8"

bindkey "\e[1;3C" forward-word
bindkey "\e[1;3D" backward-word
