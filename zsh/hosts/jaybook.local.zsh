##################################################
##                                              ##
## Author: Johannes Steudle                     ##
## File: jaybook.local.zsh                      ##
## Date: 03.12.2015                             ##
##                                              ##
## Description: file for host specific settings ##
##                                              ##
##################################################

if [[ -n $DEBUG_ZSH ]]; then
 echo 'loading jaybook.local.zsh'
fi

# show message of the day
# source $ZSH_CUSTOM/hosts/_motd.zsh

export BOOKMARKS_FILE="$HOME/.dotfiles/bookmarks"
