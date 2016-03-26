##################################################
##                                              ##
## Author: Johannes Steudle                     ##
## File: .zshrc                                 ##
## Date: 17.03.2014                             ##
##                                              ##
## Description: .zshrc general settings         ##
##                                              ##
##################################################

#export DEBUG_ZSH=true

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.dotfiles/zsh

# Set name of the theme to load.
ZSH_THEME="jay"

plugins=(hosts)

source $ZSH/init_zsh.zsh

# Set default editor
export EDITOR=mvim
export PAGER=less

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# export DISABLE_AUTO_TITLE="true"

export NVM_DIR="/Users/johannes/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# if [ -f /usr/local/share/liquidprompt ]; then
#   . /usr/local/share/liquidprompt
# fi
