#!/usr/bin/env sh

# homebrew
brew update
brew upgrade
brew cleanup
brew prune

# npm disaster
npm install npm -g
npm update -g

# update dotfiles
(cd ~/.dotfiles && git pull && make etc)
