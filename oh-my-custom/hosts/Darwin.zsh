# custom zsh commands
echo "i'm on a darwin system!"
# general
alias top='top -o cpu -n 30'
alias downtime='pmset -g log | grep -e " Sleep  " -e " Wake  "'
alias pf="open -a \"Path Finder.app\""
alias bu="brew update && brew upgrade --all && brew cleanup"

plugins+=(osx brew)
