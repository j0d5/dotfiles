##################################################
##                                              ##
## Author: Johannes Steudle                     ##
## File: jaybook.local.path.zsh                 ##
## Date: 03.12.2015                             ##
##                                              ##
## Description: file for host specific paths    ##
##                                              ##
##################################################

if [[ -n $DEBUG_ZSH ]]; then
  echo 'loading jaybook.path.zsh'
fi

# local path file
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/usr/texbin
export PYTHONPATH=/usr/local/lib/python2.7/site-packages/:$PYTHONPATH
