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
export DEFAULT_USER=johannes

setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt promptsubst

#setopt no_beep
setopt auto_cd
setopt multios
setopt cdablevars

unalias run-help
autoload run-help
HELPDIR=/usr/local/share/zsh/helpfiles

# bind UP and DOWN arrow keys
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# bind P and N for EMACS mode
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

# bind k and j for VI mode
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
