# {{{
#
# Author: Johannes Steudle
# File: paths.zsh
#
# Description: file for global settings
#
# }}}

if [[ -n $DEBUG_ZSH ]]; then
  echo 'loading global paths'
fi

export PATH=/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/bin:/sbin:$PATH
export PATH=$PATH:$HOME/.bin
fpath=(/usr/local/share/zsh-completions $fpath)

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

