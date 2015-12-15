#!/bin/bash
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
readonly CFGFILES=("zshrc" "vimrc" "gvimrc" "gitignore"\
                   "gitattributes" "hgrc" "hgignore"\
                   "liquidpromptrc" "slate" "dir_colors"\
                   "zprofile" "zlogout" "zshenv"\
                   "crontab")

# default values
FIRSTNAME="Johannes"
LASTNAME="Steudle"
EMAIL="jaycloudy@icloud.com"
GITHUBUSER="johannes82"

source $HOME/$NAME/lib.sh


if [[ -z $1 ]]; then
  FIRSTNAME=$1
fi
if [[ -z $2 ]]; then
  LASTNAME=$2
fi
if [[ -z $3 ]]; then
  EMAIL=$3
fi
if [[ -z $4 ]]; then
  GITHUBUSER=$4
fi

install_dotfiles() {
  action 'check for existing dotfiles'
  if ! [ -d $DOTDIR ]; then
    running "$DOTDIR directory does not exist, cloning..."
    # mkdir $HOME/$NAME
    git clone https://github.com/johannes82/.dotfiles.git
    ok
  else
    running "$DOTDIR directory exists" ok
  fi
  ok
}

action "Check on which system we are"
if [ "Darwin" == $(uname) ]; then
  running "we're on a mac" ok
  install_dotfiles
  require_brew
else
  fail "this system is currently not supported"
fi

check_zsh

action "Linking the dotfiles"
for file in ${CFGFILES[@]}
do
  #action "Create link for $file"
  link_dotfiles $file
done

$HOME/$NAME/osx.sh

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
