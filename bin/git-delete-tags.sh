#!/bin/sh
# {{{
#
# Author: Johannes Steudle
# File: git-delete-tags.sh
#
# Description: This is a script for checking the repository for invalid tags.
#
# }}}

# Fonts color
RED="31m"
GREEN="32m"
YELLOW="33m"
BLUE="34m"
WHITE="0m"

__print () {
    if [ "$2" = "info" ] ; then
        COLOR=$BLUE
    elif [ "$2" = "success" ] ; then
        COLOR=$GREEN
    elif [ "$2" = "warning" ] ; then
        COLOR=$YELLOW
    elif [ "$2" = "error" ] ; then
        COLOR=$RED
    else
        COLOR=$WHITE
    fi

    echo "\\033[0;$COLOR" "▸ $1" "\\033[0m"
}

# Check if we're in valid git repository
if ! [ -d ".git" ]; then
  __print "No git repository!" "error"
  exit 1
fi

__print "Fetch latest tags ..."
git fetch --tags

# Enter all valid patterns for tags, e.g. : 'release' will match all 'release/0.0.0.0' (major, minor, patch, optional build)
# VALID_TAGS="release|ff|snapshot"
# Get all invalid tags with inverse regex
# INVALID_TAGS=$(git tag | grep -vE "($VALID_TAGS)\/[0-9].[0-9].[0-9](.[0-9]+)?")
REGEX="^(release\/([0-9]+)\.([0-9]+)\.([0-9]+))$|^(snapshot\/((([0-9]+)\.([0-9]+)\.([0-9]+)(?:-([0-9-]+(?:\.[0-9a-zA-Z-]+)*))?)(?:-([0-9-]\+([0-9a-zA-Z-]+(?:\.[0-9a-zA-Z-]+)*)))?))$"
INVALID_TAGS=$(git tag | grep -vE "($REGEX)")

# Check if there are any invalid tags
if [ -z "$INVALID_TAGS" ]; then
  __print "No invalid tags found." "success"
  exit 0
fi

# Check if we really want to delete those tags
__print "$INVALID_TAGS"
__print "Delete the tags? [Y/N]" "warning"
read -r ANSWER
case "$ANSWER" in
  [Yy]|[Yy][Ee][Ss]) echo "Deleting tags ...";;
  [Nn]|[Nn][Oo]) echo "Aborting."; exit 3;;

  *) echo "Aborting."; exit 3;;
esac

# Delete those tags
for TAG in $INVALID_TAGS; do
  echo "Delete $TAG"
  git push origin :"$TAG"
done

# Clean those local tags
__print "Cleaning local tags ..."
git fetch --prune origin "+refs/tags/*:refs/tags/*"
__print "Done."
