#!/usr/bin/env sh

# homebrew
brew update
brew upgrade
brew cleanup
brew prune

# ruby gems
gem update
gem cleanup

# macOS update
softwareupdate -l
softwareupdate -ia --verbose

# npm disaster
npm install npm -g
npm update -g

# update dotfiles
(cd ~/.dotfiles && git pull && make etc)

