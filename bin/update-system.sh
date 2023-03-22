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

echo "Running system-update script"

BREW="$(command -v brew)"
if [ -x "${BREW}" ]; then
  echo "[brew] updating brew"
  ${BREW} update
  ${BREW} upgrade
  ${BREW} upgrade --cask
  ${BREW} cleanup
else
  echo >&2 "Command brew not found!"
fi

echo "[gem] updating gems"
gem update
gem cleanup

echo "[macOS] check for updates"
softwareupdate -l
softwareupdate -ia --verbose

echo "[npm] update node packages"
npm install npm -g
npm --global update
