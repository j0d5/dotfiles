# {{{
#
# Author: Johannes Steudle
# File: Darwin.zsh
#
# Description: file for global settings
#
# }}}

if [[ -n $DEBUG_ZSH ]]; then
  echo "i'm on a darwin system!"
fi

# general
alias top='top -o cpu -n 30'
alias downtime='pmset -g log | grep -e " Sleep  " -e " Wake  "'
alias pf="open -a \"Path Finder.app\""
alias bu="brew update && brew upgrade --all && brew cleanup"

source `brew --prefix`'/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh'
source `brew --prefix`'/share/zsh-history-substring-search/zsh-history-substring-search.zsh'
source `brew --prefix`/etc/profile.d/z.sh

