##################################################
##                                              ##
## Author: Johannes Steudle                     ##
## File: jaybook.hi.de.bosch.com.path.zsh       ##
## Date: 03.12.2015                             ##
##                                              ##
## Description: file for host specific paths    ##
##                                              ##
##################################################

if [[ -n $DEBUG_ZSH ]]; then
  echo 'loading jaybook.hi.de.bosch.com.path.zsh'
fi

# local path file
export PATH=$PATH:/opt/local/bin:/opt/local/sbin
export PATH=$PATH:$HOME/Library/TeXShop/bin/tslatexmk
