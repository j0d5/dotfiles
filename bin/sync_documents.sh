#!/bin/sh
# set -euo pipefail
# IFS=$'\n\t'
##################################################
##                                              ##
## Author: Johannes Steudle                     ##
## File: sync_documents.sh                      ##
## Date: 14.12.2015                             ##
##                                              ##
##################################################

EXCLUDE_FILE=$HOME/.dotfiles/scripts/exclude.rsync
SOURCE_FOLDER="$HOME/Documents/"
TARGET_FOLDER="/Volumes/jst2hi/Eigene Dateien/"

if mount | grep jst2hi; then
    echo "It's mounted."
else
    echo "It's not mounted."
    read -r "Mount Volume? [y/n] " yn
    case $yn in
		[Yy]* ) mkdir /Volumes/jst2hi \\
            mount_smbfs //jst2hi@HI00FS02/jst2hi$ /Volumes/jst2hi ;;
        [Nn]* ) exit ;;
        * ) echo "Please answer yes or no!"
    esac
fi

echo "Scanning files in folders $SOURCE_FOLDER and $TARGET_FOLDER"
RETURN=$(rsync -vrhzn --exclude-from "$EXCLUDE_FILE" "$SOURCE_FOLDER" "$TARGET_FOLDER")
echo "rsync returned: $RETURN"


# while true; do
read -r "Accept these changes? [y/n] " yn
case $yn in
    [Yy]* ) rsync -vrhz --exclude-from "$EXCLUDE_FILE" "$SOURCE_FOLDER" "$TARGET_FOLDER" ;;
    [Nn]* ) exit;;
    * ) echo "Please answer yes or no!"
esac
# done
