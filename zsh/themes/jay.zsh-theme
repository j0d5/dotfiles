##################################################
##                                              ##
## Author: Johannes Steudle                     ##
## File: jay.zsh-theme                          ##
## Date: 03.12.2015                             ##
##                                              ##
## Description: file for custom theme           ##
##                                              ##
##################################################

if [[ -n $DEBUG_ZSH ]]; then
 echo 'loading jay theme'
fi

PROMPT_COLOR_DIR="%F{green}"

# set colors for zsh git functions
ZSH_THEME_GIT_PROMPT_PREFIX="%{%F{50}%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}:"
ZSH_THEME_GIT_PROMPT_DIRTY="%{%F{red}%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{%F{green}%}"
ZSH_THEME_GIT_PROMPT_SHA_BEFORE="%{%F{45}%}"
ZSH_THEME_GIT_PROMPT_SHA_AFTER="%{$reset_color%}"

# display different symbols if git repo is modified
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%}+"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[blue]%}*"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%}-"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[magenta]%}r"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[yellow]%}═"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%}?"

# Color for zsh autosuggestion [https://github.com/zsh-users/zsh-autosuggestions]
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE=$fg[grey]

function box_name {
  [ -f ~/.box-name ] && cat ~/.box-name || echo ${SHORT_HOST:-$HOST}
}

SEGMENT_SEPARATOR=':'

# echo time
prompt_time() {
  echo -n '[%D{%H:%M:%S}] '
}

# set user and hostname
prompt_context() {
  local user=`whoami`

  if [[ "$user" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    echo -n %{$fg[magenta]%}%n%{$reset_color%}@%{$fg[green]%}$(box_name)%{$reset_color%}%{$SEGMENT_SEPARATOR%}
  fi
}

shortened_dir() {
  if [[ $(pwd) == "$HOME" ]]; then
    echo "~"
  else
    echo ${${:-/${(j:/:)${(M)${(s:/:)${(D)PWD:h}}#(|.)[^.]}}/${PWD:t}}//\/~/\~}
  fi
}

# current working directory
prompt_dir() {
  echo -n "$PROMPT_COLOR_DIR$(shortened_dir)$reset_color "
}

# returns the currently used prompt char
prompt_char() {
  git branch > /dev/null 2> /dev/null && echo '%{%F{red}%}→%{%F{white}%}' && return
  echo '→'
}

prompt_start() {
  echo -n ''
}

prompt_end() {
  echo "\n"$(prompt_status)$(prompt_char)
}

# echo git status
prompt_git() {
  if git rev-parse --git-dir > /dev/null 2>&1; then
    echo -n $fg[white]
    echo -n "["
    echo -n $fg[green]
    echo -n $(git_current_branch)
    echo -n $fg[white]
    echo -n ":"
    echo -n $(git_prompt_short_sha)
    # Show the tracked changes
    #echo -n ":"
    #echo -n $(prompt_git_commit_changes)
    echo -n "]"
    echo -n $(git_prompt_status)
    echo -n %{$reset_color%}
  fi
}

prompt_git_commit_changes() {
  git diff --shortstat | awk '{print "%{%F{red}%}+"$4 "%{%F{white}%}/%{%F{green}%}-"$6"%{%F{white}%}"}'
}

# error, root, background jobs
prompt_status() {
  local symbols
  symbols=()
  [[ $RETVAL -ne 0 ]] && symbols+="%{$fg[red]%}✘"
  [[ $UID -eq 0 ]] && symbols+="%{$fg[yellow]%}⚡"
  [[ $(jobs -l | wc -l) -gt 0 ]] && symbols+="%{$fg[cyan]%}•"

  [[ -n "$symbols" ]] && echo "$symbols%{%F{white}%}"
}

# build prompt
build_prompt() {
  prompt_start
  # prompt_time
  RETVAL=$?
  prompt_context
  prompt_dir
  prompt_git
  prompt_end
}

# set prompt including trailing space
PROMPT='$(build_prompt) '

# display exitcode on the right when >0
local return_code="%(?..%{$fg[red]%}%? ↵ %{$reset_color%})"
RPROMPT=' $return_code [%*]'
