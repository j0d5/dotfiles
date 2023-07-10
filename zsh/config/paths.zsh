# shellcheck shell=bash
# {{{
#
# Author: Johannes Steudle
# File: paths.zsh
#
# Description: file for global settings
#
# }}}

# Put homebrew stuff first
export PATH=/opt/homebrew/bin:/opt/homebrew/sbin
# User specific paths
export PATH=$PATH:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin
# System specific paths
export PATH=$PATH:/bin:/sbin
# macOS stuff
export PATH=$PATH:/Library/Apple/usr/bin:/Applications/Wireshark.app/Contents/MacOS
# Own stuff
export PATH=$PATH:$HOME/.bin
export PATH=$PATH:$HOME/.local/bin

export NVM_DIR="$HOME/.nvm"
# shellcheck source=/dev/null
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# >>> talisman >>>
# Below environment variables should not be modified unless you know what you are doing
export TALISMAN_HOME="$HOME/.talisman/bin"
alias talisman='$TALISMAN_HOME/talisman_darwin_amd64'
export TALISMAN_INTERACTIVE=false
# <<< talisman <<<
# pnpm
export PNPM_HOME="/Users/johannes/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end
