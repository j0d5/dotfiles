# shellcheck shell=bash
# {{{
#
# Author: Johannes Steudle
# File: hosts.zsh
#
# Description: file for loading settings depending on the host
#
# }}}

platform=$(uname)
# shellcheck source=/dev/null
test -r "$ZSH/hosts/$platform.zsh" && . "$ZSH/hosts/$platform.zsh"

# shellcheck source=/dev/null
test -r "$ZSH/hosts/$HOST.zsh" && . "$ZSH/hosts/$HOST.zsh"
# shellcheck source=/dev/null
test -r "$ZSH/hosts/$HOST.path.zsh" && . "$ZSH/hosts/$HOST.path.zsh"
# shellcheck source=/dev/null
test -r "$ZSH/hosts/$HOST.aliases.zsh" && . "$ZSH/hosts/$HOST.aliases.zsh"
