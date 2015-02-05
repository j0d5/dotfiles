#!/bin/bash
echo "copy script for dotfiles"

if [[ "Darwin" == $(uname) ]]; then
	echo "we're on a mac"
fi

if [[ -d ~/.dotfiles ]]; then
	echo "dotfiles directory exists, now linking files..."

	cd ~/
	ln -is ~/.dotfiles/bashrc    .bashrc
	ln -is ~/.dotfiles/zshrc     .zshrc
	ln -is ~/.dotfiles/vimrc     .vimrc
	ln -is ~/.dotfiles/gvimrc    .gvimrc
	ln -is ~/.dotfiles/gitignore .gitignore
	ln -is ~/.dotfiles/gitconfig .gitconfig
	ln -is ~/.dotfiles/gitattributes .gitattributes
	ln -is ~/.dotfiles/hgrc      .hgrc
	ln -is ~/.dotfiles/hgignore  .hgignore

	echo "linking sublime files..."
	if [[ -d ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User ]]; then
		cd ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
		ln -is ~/.dotfiles/sublime_user/Preferences.sublime-settings
		ln -is ~/.dotfiles/sublime_user/CheckBounce.sublime-settings
		ln -is ~/.dotfiles/sublime_user/Default\ \(OSX\).sublime-settings
		ln -is ~/.dotfiles/sublime_user/LaTeX.sublime-settings
		ln -is ~/.dotfiles/sublime_user/Package\ Control.sublime-settings
		ln -is ~/.dotfiles/sublime_user/Side\ Bar.sublime-settings
	else
		echo "ERROR: \
			 ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User \
			 does not exist."
	fi
fi
