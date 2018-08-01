#!/bin/sh

# Check the given file for debug symbols
checkForDebugBuild () {
    file=$1

    __print "Checking for debug symbols $file..." "info"

    __check_architectures "$file"

    __check_encryption "$file"

    __check_for_assertion "$file"

    __check_debug_symbols "$file"
}

__check_architectures () {
    __print "Extracting architectures..." "info"
    if [ "$(command -v lipo)" ]; then
        lipo -i "$1"
    fi
    __print
}

__check_for_assertion () {
    __print "Check for assertions..." "info"

    if nm "$1" | grep -q "NSAssertionHandler"; then
        __print "Found assertion symbols!" "error"
    else
        __print "No assertion symbols found!"
    fi
    __print
}

__check_debug_symbols () {
    __print "Extracting object symbols to files" "info"
    firstFile="/var/tmp/nonDebugSymbols.txt"
    secondFile="/var/tmp/allSymbols.txt"
    __print

    nm "$1" > $firstFile
    nm -a "$1" > $secondFile

    __print "Check if there is a difference..." "info"
    result=$(diff -q $firstFile $secondFile)
    __print

    __print "Return from difftool: $result"
    if test -n result; then
    __print "could be a debug build" "warning"
    fi
    __print

    __print "Removing created temporary files"
    # rm $firstFile
    # rm $secondFile
    __print
}

# "Checks if unwanted profiling data are in the library"
__check_profiling_data () {
    __print "Check profiling info..." "info"
    if otool -l -arch all "$1" | grep __llvm_; then
        __print "Contains profiling data!" "error"
    else
        __print "No profiling info found!"
    fi
    __print
}

    # "Checks if the library is encrypted"
__check_encryption () {
    __print "Check encryption info..." "info"
    if otool -l "$1" | grep -A 4 LC_ENCRYPTION_INFO; then
        __print "Encryption info found!"
    else
        __print "No encryption info found!"
    fi
    __print
}

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

if [ -z "$1" ]; then
    echo "No file name!"
    echo "Usage: checkForDebugBuild <file>"
    exit 1
fi

if [ -e "$1" ]; then
    checkForDebugBuild "$1"
else
    __print "File $1 not found!" "error"
fi

