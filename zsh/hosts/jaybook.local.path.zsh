# {{{
#
# Author: Johannes Steudle
# File: jaybook.local.zsh
#
# Description: file for global settings
#
# }}}

if [[ -n $DEBUG_ZSH ]]; then
  echo 'loading jaybook.path.zsh'
fi

# local path file
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/usr/texbin
export PYTHONPATH=/usr/local/lib/python2.7/site-packages/:$PYTHONPATH
