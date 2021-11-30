# {{{
#
# Author: Johannes Steudle
# File: functions.zsh
#
# Description: file for global settings
#
# }}}

# greps for process
function psg() {
  if [ ! -z $1 ] ; then
    echo "Grepping for processes matching $1..."
    ps aux | grep -i $1 | grep -v grep
  else
    echo "!! Need name to grep for"
  fi
}

# greps for open files
function lsofg() {
  if [ ! -z $1 ] ; then
    echo "Grepping for open files matching $1..."
    lsof | grep -i $1 | grep -v grep
  else
    echo "!! Need name to grep for"
  fi
}

# greps the history for first argument
function histg() {
  if [ ! -z $1 ] ; then
    echo "Grepping history for $1..."
    cat ~/.bash_history | grep -i $1 | grep -v grep
  else
    echo "!! Need name to grep for"
  fi
}

# changes the modifier for given file and dir
function chmod_fd {
  find . -type f -exec chmod $1 {} \;
  find . -type d -exec chmod $2 {} \;
}

# prompts the virtual environment information
function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

function setjdk() {
  if [ $# -ne 0 ]; then
    removeFromPath '/System/Library/Frameworks/JavaVM.framework/Home/bin'
    if [ -n "${JAVA_HOME+x}" ]; then
      removeFromPath $JAVA_HOME
    fi
    export JAVA_HOME=`/usr/libexec/java_home -v $@`
    export PATH=$JAVA_HOME/bin:$PATH
  fi
  echo JAVA_HOME set to $JAVA_HOME
  java -version
}

function removeFromPath() {
  export PATH=$(echo $PATH | sed -E -e "s;:$1;;" -e "s;$1:?;;")
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
    >&2 echo "Command brew not found!"
  fi
}

function macup() {
  echo "Updating macOS"
  softwareupdate -l
  softwareupdate -ia --verbose
}

function updateAll() {
  echo "[gem] Update gems..."
  gem update; gem cleanup

  echo "[npm] Update node packages"
  npm --global update
}

