## Johannes' global alias settings                ##
alias ..='cd ..'
alias ll='ls -Glh'
alias la='ls -GAlh'
alias lt='ls -GAlhTt'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias top='top -o cpu -n 30'
alias mylogs='sudo tail -f /var/log/{system.log,secure.log}' 
alias myip="wget -qO - http://checkip.dyndns.org | sed 's/[a-zA-Z<>/ :]//g'" 
## command aliases
alias x='exit'
alias c='clear'
alias s='screen'
alias r='screen -R'
alias vi='vim'
alias sls='screen -ls'
alias zrc='vim ~/.zshrc'
alias e='smartextract'
alias o='open'
alias fif='find . -type f \( -name "*.c*" -o -name "*.h" \) -print | xargs grep -in'
alias loc='find . -type f \( -name "*.c*" -o -name "*.h" -o -name "*.py" -o -name "*.sh" \) -print | xargs cat | wc -l'

