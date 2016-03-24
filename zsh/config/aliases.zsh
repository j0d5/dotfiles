##################################################
##                                              ##
## Author: Johannes Steudle                     ##
## File: aliases.zsh                            ##
## Date: 03.12.2015                             ##
##                                              ##
## Description: file for global aliases         ##
##                                              ##
##################################################
if [[ -n $DEBUG_ZSH ]]; then
  echo 'loading global aliases'
fi

alias ..='cd ..'

# list as colored list with human readable sizes
alias l='ls -Glhp'

# list all as colored list with human readable sizes
alias la='ls -GAlhp'

# list sorted by time
alias lt='ls -GAlhTt'

# colors the grep output
alias grep='grep --color=auto'

# colors the fgrep output
alias fgrep='fgrep --color=auto'

# colors the egrep output
alias egrep='egrep --color=auto'
alias mylogs='sudo tail -f /var/log/{system.log,secure.log}'

# show my own ip
alias myip="wget -qO - http://checkip.dyndns.org | sed 's/[a-zA-Z<>/ :]//g'"

## command aliases
alias x='exit'
alias c='clear'
alias vi='vim'
alias e='smartextract'
alias o='open'

# find in files, looks for a expression in the current directory for all .c and .h files
alias fif='find . -type f \( -name "*.c*" -o -name "*.h" \) -print | xargs grep -in'

# lines of code, counts the lines of code in source code files
alias loc='find . -type f \( -name "*.c*" -o -name "*.h" -o -name "*.py" -o -name "*.sh" -o -name "*.m" -o -name "*.swift" -o -name "*.java" \) -print | xargs cat | wc -l'

## bookmarks
alias j="jump"
alias s="bookmark"
# alias d="deletemark"
# alias p="showmarks"
alias lb="showmarks"
