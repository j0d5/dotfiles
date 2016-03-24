##################################################
##                                              ##
## Author: Johannes Steudle                     ##
## File: jaybook.local.aliases.zsh              ##
## Date: 03.12.2015                             ##
##                                              ##
## Description: file for host specific aliases  ##
##                                              ##
##################################################

if [[ -n $DEBUG_ZSH ]]; then
  echo 'loading jaybook.local.aliases.zsh'
fi

alias gvim='open /opt/homebrew-cask/Caskroom/macvim/7.4-85/MacVim.app/Contents/MacOS/MacVim'
alias vim='/opt/homebrew-cask/Caskroom/macvim/7.4-85/MacVim.app/Contents/MacOS/Vim'
alias pg_stop='sudo -u postgres /Library/PostgreSQL/9.0/bin/pg_ctl stop -D /Library/PostgreSQL/9.0/data'
