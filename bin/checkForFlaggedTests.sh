#!/bin/sh
set -e

# fonts color
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

# Checks for patterns like 'fit('
CHECKED_FLAGS="(fcontext\(|fdescribe\(|xcontext\(|xdescribe\(|fit\(|xit\()"

if ! [ -x "$(command -v ag)" ]; then
  __print "The silversearcher is needed to find the flags" "error"
  __print "Install with brew install ag" "info"
  exit 1
fi

__print "Checking for $CHECKED_FLAGS" "info"
RESULT=$(ag --swift --objc "$CHECKED_FLAGS" ./SDK/)

if [ -n "$RESULT" ]; then
    echo "Found $RESULT"
    exit 1
else
    echo "Nothing found!"
fi

