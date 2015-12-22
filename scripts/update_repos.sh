#!/bin/bash
set -euo pipefail
IFS=$'\n\t'
##################################################
##                                              ##
## Author: Johannes Steudle                     ##
## File: install.sh                             ##
## Date: 14.12.2015                             ##
##                                              ##
## Description: This is a script for checking   ##
##              the current directory for git   ##
##              repositories and update them.   ##
##                                              ##
##################################################

if [ -z "$1" ]; then
	curDir=$(pwd)
else
	curDir=$1
fi
echo "Current working directory: $curDir"

readonly repos=( $(find "$curDir" -type d -maxdepth 2) )

checkIfRepository() {
	if [ -z "$1" ]; then
		echo "Parameter is zero!"
		return 1
	else
		if [ -d "$1"/.git ]; then
			return
		else
			return 1
		fi
	fi
}

for name in "${repos[@]}"; do
	if checkIfRepository "$name" ; then
		echo "Updating repository $name"
		cd "$name" || exit
		git remote update -p; git merge --ff-only @{u}
		cd "$curDir" || exit
	else
		cd "$curDir" || exit
	fi
done

