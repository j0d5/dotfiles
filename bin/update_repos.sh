#!/bin/sh
# set -euo pipefail
# IFS=$'\n\t'

# {{{
#
# Author: Johannes Steudle
# File: update_repos.sh
#
# Description: This is a script for checking the current directory for git repositories and update them.
#
# }}}

if [ -z "$1" ]; then
    curDir=$(pwd)
else
    curDir="$1"
fi

echo "Current working directory: $curDir"

export http_proxy=localhost:8080
export https_proxy=localhost:8080

readonly repos=( $(find "$curDir" -type d -maxdepth 2) )

for name in "${repos[@]}"; do
    if [ -d "$name"/.git ]; then
        echo "Updating repository $name"
        (cd "$name" && git remote update -p; git merge --ff-only @{u})
    fi
done
