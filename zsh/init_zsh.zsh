# shellcheck shell=bash
# {{{
#
# Author: Johannes Steudle
# File: init_zsh.zsh
#
# Description: file for global settings
#
# }}}

[[ -n $DEBUG_ZSH ]] && echo 'loading init_zsh'

# Set default editor
export EDITOR=nvim
export PAGER=less

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# shellcheck disable=SC2296
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
# shellcheck source=/dev/null
  . "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set name of the theme to load.
# ZSH_THEME="tweetjay"
ZSH_THEME="powerlevel10k"

# Load all stock functions (from $fpath files) called below.
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compaudit compinit
  compaudit
  compinit
fi

# Load all of the plugins that were defined in ~/.zshrc
for plugin in $PLUGINS
do
  if [ -s "$ZSH/plugins/$plugin/$plugin.plugin.zsh" ]; then
    if [[ -n $DEBUG_ZSH ]]; then
      echo "Load plugin $plugin"
    fi
    # shellcheck source=/dev/null
    . "$ZSH/plugins/$plugin/$plugin.plugin.zsh"
  fi
done

# Load files in $ZSH/lib/ that end in .zsh
for lib_file in "$ZSH"/lib/*.zsh
do
  if [[ -n $DEBUG_ZSH ]]; then
    echo "Load lib $lib_file"
  fi
  # shellcheck source=/dev/null
  . "$lib_file"
done

# Load files in $ZSH/config/ that end in .zsh
for config_file in "$ZSH"/config/*.zsh
do
  if [[ -n $DEBUG_ZSH ]]; then
    echo "Load config $config_file"
  fi
  # shellcheck source=/dev/null
  . "$config_file"
done
unset config_file

# Load the theme
# shellcheck source=/dev/null
. "$ZSH/themes/$ZSH_THEME/$ZSH_THEME.zsh-theme"

### Load fuzzy search
# shellcheck source=/dev/null
[ -s "$HOME/fzf.zsh" ] && . "$HOME/fzf.zsh"

### Load Powerlevel10k configuration
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# shellcheck source=/dev/null
[ -s "$HOME/.p10k.zsh" ] && . "$HOME/.p10k.zsh"

# >>> talisman >>>
# Below environment variables should not be modified unless you know what you are doing
export TALISMAN_HOME="$HOME/.talisman/bin"
alias talisman='$TALISMAN_HOME/talisman_darwin_amd64'
export TALISMAN_INTERACTIVE=false
# <<< talisman <<<

# Node Version Management
export NVM_DIR="$HOME/.nvm"
# shellcheck source=/dev/null
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
# shellcheck source=/dev/null
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

autoload -U add-zsh-hook

load-nvmrc() {
  local nvmrc_path
  nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version
    nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$(nvm version)" ]; then
      nvm use > /dev/null
    fi
  elif [ -n "$(PWD=$OLDPWD nvm_find_nvmrc)" ] && [ "$(nvm version)" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default > /dev/null
  fi
}

add-zsh-hook chpwd load-nvmrc
load-nvmrc
# Node Version Management

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

# pyenv setup
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="$PYENV_ROOT/shims:${PATH}"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Load completion for kubectl
if type kubectl > /dev/null 2>&1; then
# shellcheck source=/dev/null
  . <(kubectl completion zsh)
fi

# Load completion for helm
if type helm > /dev/null 2>&1; then
# shellcheck source=/dev/null
  . <(helm completion zsh)
fi

# Rust
# shellcheck source=/dev/null
[ -s "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

# 1Password plugins
# shellcheck source=/dev/null
. "$HOME/.config/op/plugins.sh"

# Load Angular CLI autocompletion.
if type ng > /dev/null 2>&1; then
# shellcheck source=/dev/null
  . <(ng completion script)
fi

### Initialize SDKMAN
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
# shellcheck source=/dev/null
[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ] && . "$HOME/.sdkman/bin/sdkman-init.sh"

# shellcheck source=/dev/null
[ -s "$HOME/.zshrc_local" ] && . "$HOME/.zshrc_local"
