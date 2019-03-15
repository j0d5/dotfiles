#!/bin/sh
# set -euo pipefail
# IFS=$'\n\t'

# {{{
#
# Author: Johannes Steudle
# File: system-update.sh
#
# Description: This is a script for updating system tools
#
# }}}

echo "Running system-update script"

# check for proxy
if ifconfig | grep -q 'inet 10.'; then
  echo "Found company network"
  export http_proxy=localhost:8080
  export https_proxy=localhost:8080
fi

# homebrew
BREW=/usr/local/bin/brew
if [ -x "$BREW" ]; then
  echo "Updating brew"
  $BREW update
  $BREW upgrade
  $BREW cask upgrade
  $BREW cleanup
  $BREW prune
else
  >&2 echo "Command brew not found!"
fi

echo "Updating gems"
# ruby gems
gem update
gem cleanup

echo "Updating macOS"
# macOS update
softwareupdate -l
softwareupdate -ia --verbose

echo "Updating npm"
# npm disaster
npm install npm -g
npm update -g
