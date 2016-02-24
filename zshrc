##################################################
##                                              ##
## Author: Johannes Steudle                     ##
## File: .zshrc                                 ##
## Date: 17.03.2014                             ##
##                                              ##
## Description: .zshrc general settings         ##
##                                              ##
##################################################

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.dotfiles/oh-my-zsh

# custom directory
ZSH_CUSTOM=$HOME/.dotfiles/oh-my-custom

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="jay"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="false"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# export DISABLE_AUTO_TITLE="true"

# Set default editor
export EDITOR=mvim

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(git git-flow rails git textmate ruby lighthouse)
plugins=(hosts history-substring-search zsh-syntax-highlighting git wd command-not-found sublime brew gradle osx z)

source $ZSH/oh-my-zsh.sh

export NVM_DIR="/Users/johannes/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# if [ -f /usr/local/share/liquidprompt ]; then
#   . /usr/local/share/liquidprompt
# fi
