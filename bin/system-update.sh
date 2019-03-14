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

echo "Running system update"

export http_proxy=localhost:8080
export https_proxy=localhost:8080

echo "Updating brew"
# homebrew
brew update
brew upgrade
brew cask upgrade
brew cleanup
brew prune

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

# update dotfiles
# (cd ~/.dotfiles && git pull && make etc)
