#!/bin/sh
# set -euo pipefail
# IFS=$'\n\t'
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
	curDir="$1"
fi
echo "Current working directory: $curDir"

readonly repos=( $(find "$curDir" -type d -maxdepth 2) )

for name in "${repos[@]}"; do
    [ -d "$name"/.git ] && echo "Updating repository $name" \
        && (cd "$name" && git remote update -p; git merge --ff-only @{u})
done

