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

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
