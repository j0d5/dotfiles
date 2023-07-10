#!/bin/sh
# set -e

# Check the given file for debug symbols
checkForDebugBuild () {
    file=$1

    __print "Checking for debug symbols $file..." "info"

    __check_architectures "$file"

    __check_coverage_symbols "$file"

    __check_profiling_data "$file"

    __check_encryption "$file"

    __check_bitcode_availability "$file"

    __check_for_assertion "$file"

    __check_debug_symbols "$file"
}

# Checks if the library contains all necessary architectures
__check_architectures () {
    __print "Checking architectures..." "info"
    if ! [ -x "$(command -v lipo)" ]; then
        __print "lipo not available!" "error"
        return
    fi

    # there're 2 architectures which are not build at the moment: arm64e, armv7s
    VALID_ARCHS="i386 x86_64 armv7 arm64"
    ARCHITECTURES="$(lipo -info "$1" | rev | cut -d ':' -f1 | rev)"
    IS_FAT=true
    for VALID_ARCH in $VALID_ARCHS; do
        FOUND=false
        for ARCH in $ARCHITECTURES; do
            if [ "$VALID_ARCH" = "$ARCH" ]; then
                FOUND=true
            fi
        done
        if [ $FOUND = false ]; then
            IS_FAT=false
            __print "Did not find architecture $VALID_ARCH" "warning"
            break
        fi
    done

    if [ $IS_FAT = true ]; then
        __print "It's a fat library: $ARCHITECTURES" "success"
    else
        __print "It's a thin library: $ARCHITECTURES" "warning"
    fi
    __print
}

# Checks if the library contains unwanted coverage data
__check_coverage_symbols () {
    __print "Check for coverage symbols..." "info"
    if ! [ -x "$(command -v otool)" ]; then
        __print "otool not available!" "error"
        return
    fi

    if otool -l -arch all "$1" | grep __llvm_cov; then
        __print "Contains coverage symbols!" "error"
    else
        __print "No coverage symbols found!" "success"
    fi
    __print
}

# Checks if the library contains unwanted profiling data
__check_profiling_data () {
    __print "Check profiling info..." "info"
    if ! [ -x "$(command -v otool)" ]; then
        __print "otool not available!" "error"
        return
    fi

    if otool -l -arch all "$1" | grep __llvm_; then
        __print "Contains profiling data!" "error"
    else
        __print "No profiling info found!" "success"
    fi
    __print
}

# Checks if the library is encrypted, it's not a must
__check_encryption () {
    __print "Check encryption info..." "info"
    if ! [ -x "$(command -v otool)" ]; then
        __print "otool not available!" "error"
        return
    fi

    if otool -l "$1" | grep -q LC_ENCRYPTION_INFO; then
        __print "Encryption info found!"
    else
        __print "No encryption info found!"
    fi
    __print
}

# Checks if the library contains information about bitcode
__check_bitcode_availability () {
    __print "Check if bitcode is available" "info"
    if ! [ -x "$(command -v otool)" ]; then
        __print "otool not available!" "error"
        return
    fi

    # Check for LLVM symbols, indicator for bitcode
    CONTAINS_LLVM=false
    if otool -arch arm64 -l "$1" | grep -q __LLVM; then
        CONTAINS_LLVM=true
    fi

    # Check for filesize > 1, in combination with LLVM symbols it means that we use bitcode
    CONTAINS_FILESIZE=true
    SIZES=$(otool -arch arm64 -l "$1" | grep filesize | rev | cut -d ' ' -f1 | rev)
    for FILESIZE in $SIZES; do
        if ! [ "$FILESIZE" -gt "1" ]; then
            CONTAINS_FILESIZE=false
        fi
    done

    if [ $CONTAINS_LLVM = true ] && [ $CONTAINS_FILESIZE = true ]; then
        __print "Bitcode active!" "success"
    else
        __print "Bitcode inactive!"
    fi
    __print
}

# Checks if the library contains active assertions
__check_for_assertion () {
    __print "Check for assertions..." "info"
    if ! [ -x "$(command -v nm)" ]; then
        __print "nm not available!" "error"
        return
    fi

    if nm "$1" | grep -q "NSAssertionHandler"; then
        __print "Found assertion symbols!" "error"
    else
        __print "No assertion symbols found!" "success"
    fi
    __print
}

# Checks if there are debugs symbols in the library
__check_debug_symbols () {
    __print "Check for debug symbols" "info"
    if ! [ -x "$(command -v nm)" ]; then
        __print "nm not available!" "error"
        return
    fi

    firstFile="/var/tmp/nonDebugSymbols.txt"
    secondFile="/var/tmp/allSymbols.txt"

    # Dump symbols to files
    nm "$1" > $firstFile
    nm -a "$1" > $secondFile

    # Diff files
    diff -q $firstFile $secondFile
    result=$?

    if [ $result -eq 1 ]; then
        __print "Contains debug symbols! Please check files." "error"
    else
        __print "No debug information found!" "success"
        rm $firstFile
        rm $secondFile
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

    printf "\\033[0;%s ▸ %s" "\\033[0m" $COLOR "$1"
}

if [ -z "$1" ]; then
    __print "No file name!" "error"
    printf "Usage: checkForDebugBuild <file>"
    exit 1
fi

if [ -e "$1" ]; then
    checkForDebugBuild "$1"
else
    __print "File $1 not found!" "error"
fi
