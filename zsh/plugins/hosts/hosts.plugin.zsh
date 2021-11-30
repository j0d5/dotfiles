# {{{
#
# Author: Johannes Steudle
# File: hosts.zsh
#
# Description: file for loading settings depending on the host
#
# }}}

platform=`uname`
test -r $ZSH/hosts/$platform.zsh && source $ZSH/hosts/$platform.zsh

test -r $ZSH/hosts/$HOST.zsh && source $ZSH/hosts/$HOST.zsh
test -r $ZSH/hosts/$HOST.path.zsh && source $ZSH/hosts/$HOST.path.zsh
test -r $ZSH/hosts/$HOST.aliases.zsh && source $ZSH/hosts/$HOST.aliases.zsh
