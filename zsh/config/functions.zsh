# shellcheck shell=bash
# {{{
#
# Author: Johannes Steudle
# File: functions.zsh
#
# Description: file for global settings
#
# }}}

# greps for open files
function lsofg() {
    if [ -n "$1" ]; then
        echo "Grepping for open files matching $1..."
        lsof | grep -i "$1" | grep -v grep
    else
        echo "!! Need name to grep for"
    fi
}

# changes the modifier for given file and dir
function chmod_fd {
    find . -type f -exec chmod "$1" {} \;
    find . -type d -exec chmod "$2" {} \;
}

# prompts the virtual environment information
function virtualenv_info {
    [ "$VIRTUAL_ENV" ] && echo '('"$(basename "$VIRTUAL_ENV")"') '
}

function setjdk() {
    if [ $# -ne 0 ]; then
        removeFromPath '/System/Library/Frameworks/JavaVM.framework/Home/bin'
        if [ -n "${JAVA_HOME+x}" ]; then
            removeFromPath "$JAVA_HOME"
        fi
        JAVA_HOME=$(/usr/libexec/java_home -v "$@")
        export JAVA_HOME
        export PATH=$JAVA_HOME/bin:$PATH
    fi
    echo JAVA_HOME set to "$JAVA_HOME"
    java -version
}

function removeFromPath() {
    PATH=$(echo "$PATH" | sed -E -e "s;:$1;;" -e "s;$1:?;;")
    export PATH
}

function brewup() {
    BREW=$(which brew)
    if [ -x "$BREW" ]; then
        echo "Updating brew"
        $BREW update
        $BREW upgrade
        $BREW upgrade --cask
        $BREW cleanup
    else
        echo >&2 "Command brew not found!"
    fi
}

function macup() {
    echo "Updating macOS"
    softwareupdate -l
    softwareupdate -ia --verbose
}

function npmup() {
    echo "[npm] Update node packages"
    npm --global update
}

function gemup() {
    echo "[gem] Update gems..."
    gem update
    gem cleanup
}

function updateAll() {
    brewup
    macup
    gemup
    npmup
}
