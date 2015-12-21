#!/bin/bash
###
# This is a script for checking the current directory for git repositories and
# update them.
#
# Author: Johannes Steudle
#
###

if [ -z "$1" ]; then
	curDir=$(pwd)
else
	curDir=$1
fi
echo "Current working directory: $curDir"

readonly repos=( $(find "$curDir" -type d -maxdepth 2) )

checkIfRepository() {
	if [ -z "$1" ]; then
		echo "Parameter is zero!";
		return -1
	else
		if [ -d "$1"/.git ]; then
			return
		else
			return -1
		fi
	fi
}

for name in ${repos[@]}; do
	# echo "Checking $name"
	if checkIfRepository $name ; then
		echo "Updating repository $name"
		cd "$name"
		git remote update -p; git merge --ff-only @{u};
		cd $curDir;
	else
		# echo "No git repository";
		cd $curDir;
	fi
done

