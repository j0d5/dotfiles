#!/bin/bash
# set -euo pipefail
# IFS=$'\n\t'
##################################################
##                                              ##
## Author: Johannes Steudle                     ##
## File: install.sh                             ##
## Date: 14.12.2015                             ##
##                                              ##
## Description: file for installing dotfiles    ##
##              and setting up the system       ##
##                                              ##
##################################################
echo "linking script for dotfiles"

# constants
readonly NAME=".dotfiles"
readonly DOTDIR="$HOME/$NAME"
readonly BAK="dotfiles_backup"
readonly CFGFILES=("zshrc" "vimrc" "gvimrc"\
 "gitconfig" "gitignore" "gitattributes"\
 "hgrc" "hgignore"\
 "zprofile" "zlogout" "zshenv"\
 "liquidpromptrc" "slate" "dir_colors" "editorconfig"\
 "crontab" "ansiweatherrc" "htoprc" "valgrindrc")

install_dotfiles() {
  echo 'check for existing dotfiles'
  if ! [ -d "$DOTDIR" ]; then
    echo "$DOTDIR directory does not exist, cloning..."
    git clone https://github.com/tweetjay/.dotfiles.git
    cd "$DOTDIR" && git submodule init && git submodule update
    echo "Ready to go!"
  else
    echo "$DOTDIR directory exists, continuing..."
  fi
}
install_dotfiles

# shellcheck source=config/lib.sh
source "$DOTDIR"/config/lib.sh

action "Check on which system we are"
if [ "Darwin" == "$(uname)" ]; then
  running "we're on a mac" ok
  require_brew
else
  fail "this system is currently not supported"
fi

check_zsh

action "Linking the dotfiles"
for file in "${CFGFILES[@]}"
do
  link_dotfiles "$file"
done

"$DOTDIR"/config/osx.sh

running 'Everything installed!' ok


# echo "linking sublime files..."
# if [[ -d ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User ]]; then
#   cd ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
#   ln -is ~/.dotfiles/sublime_user/Preferences.sublime-settings
#   ln -is ~/.dotfiles/sublime_user/CheckBounce.sublime-settings
#   ln -is ~/.dotfiles/sublime_user/Default\ \(OSX\).sublime-settings
#   ln -is ~/.dotfiles/sublime_user/LaTeX.sublime-settings
#   ln -is ~/.dotfiles/sublime_user/Package\ Control.sublime-settings
#   ln -is ~/.dotfiles/sublime_user/Side\ Bar.sublime-settings
# else
#   echo "ERROR: \
#      ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User \
#      does not exist."
# fi
