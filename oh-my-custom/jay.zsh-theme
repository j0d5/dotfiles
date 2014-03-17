echo 'loading jay theme'

# set colors for zsh git functions
ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_SHA_BEFORE="[%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SHA_AFTER="%{$reset_color%}]"

# display different symbols if git repo is modified
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%} ✚"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[blue]%} ✹"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} ✖"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[magenta]%} ➜"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[yellow]%} ═"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%} ✭"

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

# current working directory
prompt_dir() {
  echo -n %{$fg_bold[green]%}%~ %{$reset_color%}
}

# returns the currently used prompt char
prompt_char() {
    git branch >/dev/null 2>/dev/null && echo '±' && return
    echo '⮀'
}

prompt_start() {
  echo -n '['
}

prompt_end() {
  echo "]\n"$(prompt_char)
}

# echo git status
prompt_git() {
  echo -n $(git_prompt_info)
  echo -n $(git_prompt_short_sha)
  echo -n $(git_prompt_status)
  echo -n %{$reset_color%}
}

# error, root, background jobs
prompt_status() {
  local symbols
  symbols=()
  [[ $RETVAL -ne 0 ]] && symbols+="%{%F{red}%}✘"
  [[ $UID -eq 0 ]] && symbols+="%{%F{yellow}%}⚡"
  [[ $(jobs -l | wc -l) -gt 0 ]] && symbols+="%{%F{cyan}%}⚙"

  [[ -n "$symbols" ]] && "$symbols"
}

# build prompt
build_prompt() {
  prompt_start
  # prompt_time
  RETVAL=$?
  prompt_status
  prompt_context
  prompt_dir
  prompt_git
  prompt_end
}

# set prompt
PROMPT='$(build_prompt) '

# display exitcode on the right when >0
local return_code="%(?..%{$fg[red]%}%? ↵ %{$reset_color%})"
RPROMPT=' $return_code [%*]'
