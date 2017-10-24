##################################################
##                                              ##
## Author: Johannes Steudle                     ##
## File: paths.zsh                              ##
## Date: 03.12.2015                             ##
##                                              ##
## Description: file for global path settings   ##
##                                              ##
##################################################
if [[ -n $DEBUG_ZSH ]]; then
  echo 'loading global paths'
fi

export PATH=/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/bin:/sbin:$PATH
export PATH=$PATH:$HOME/.bin
fpath=(/usr/local/share/zsh-completions $fpath)
