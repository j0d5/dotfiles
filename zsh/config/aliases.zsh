# {{{
#
# Author: Johannes Steudle
# File: aliases.zsh
#
# Description: file for aliases
#
# }}}

alias ..='cd ..'

# list as colored list with human readable sizes
alias l='ls -Glhp'

# list sorted by time
alias lt='ls -GAlhTt'

# list all as colored list with human readable sizes
# exa:
if [[ "$OSTYPE" = darwin* ]]; then
  alias la="exa -abghl --git --color=automatic"
else
  alias la="ls -lah"
fi

# `cat` with beautiful colors. requires: pip install -U Pygments
alias c='pygmentize -O style=borland -f console256 -g'

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

