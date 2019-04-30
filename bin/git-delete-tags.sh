#!/bin/sh
# {{{
#
# Author: Johannes Steudle
# File: git-delete-tags.sh
#
# Description: This is a script for checking the repository for invalid tags.
#
# }}}

# Check if we're in valid git repository
if ! [ -d ".git" ]; then
  echo "No git repository!"
  exit 1
fi

VALID_TAGS="release|ff|dr"
INVALID_TAGS=$(git tag | grep -vE "($VALID_TAGS)\/[0-9].[0-9].[0-9](.[0-9]+)?")

# Check if there are any invalid tags
if [ -z "$INVALID_TAGS" ]; then
  echo "No invalid tags found."
  exit 0
fi

# Check if we really want to delete those tags
echo "$INVALID_TAGS"
echo "Delete the following tags? [Y/N]"
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
echo "Cleaning local tags ..."
git fetch --prune origin "+refs/tags/*:refs/tags/*"
echo "Done."
