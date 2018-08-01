#!/bin/sh

CHECKED_FLAGS="(fcontext\(|fdescribe\(|xcontext\(|xdescribe\(|fit\(|xit\()"

echo "Checking for $CHECKED_FLAGS"
RESULT=$(ag --swift --objc "$CHECKED_FLAGS" ./SDK/)

if [ -n "$RESULT" ]; then
    echo "Found $RESULT"
    exit 1
else
    echo "Nothing found!"
fi

