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
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
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
for plugin ($plugins); do
  if [ -f $ZSH/plugins/$plugin/$plugin.plugin.zsh ]; then
    if [[ -n $DEBUG_ZSH ]]; then
      echo "Load plugin $plugin"
    fi
    source $ZSH/plugins/$plugin/$plugin.plugin.zsh
  fi
done

# Load files in $ZSH/lib/ that end in .zsh
for lib_file ($ZSH/lib/*.zsh); do
  if [[ -n $DEBUG_ZSH ]]; then
    echo "Load lib $lib_file"
  fi
  source $lib_file
done

# Load files in $ZSH/config/ that end in .zsh
for config_file ($ZSH/config/*.zsh(N)); do
  if [[ -n $DEBUG_ZSH ]]; then
    echo "Load config $config_file"
  fi
  source $config_file
done
unset config_file

# Figure out the SHORT hostname
if [[ "$OSTYPE" = darwin* ]]; then
  # OS X's $HOST changes with dhcp, etc. Use ComputerName if possible.
  SHORT_HOST=$(scutil --get ComputerName 2>/dev/null) || SHORT_HOST=${HOST/.*/}
else
  SHORT_HOST=${HOST/.*/}
fi

# Load the theme
source "$ZSH/themes/$ZSH_THEME/$ZSH_THEME.zsh-theme"

### Load shellfishrc
test -e "$HOME/.shellfishrc" && source "$HOME/.shellfishrc"

### Load fuzzy search
[ -f "$HOME/fzf.zsh" ] && source "$HOME/fzf.zsh"

### Load Powerlevel10k configuration
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f "$HOME/.p10k.zsh" ]] || source "$HOME/.p10k.zsh"

# Load completion for kubectl
if type kubectl > /dev/null 2>&1; then
  source <(kubectl completion zsh)
fi

# Load completion for helm
if type helm > /dev/null 2>&1; then
  source <(helm completion zsh)
fi

# PyEnv
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

# Rust
[[ -f "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"

# 1Password plugins
source $HOME/.config/op/plugins.sh

# Load Angular CLI autocompletion.
source <(ng completion script)

### Initialize SDKMAN
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

[[ -f "$HOME/.zshrc_local" ]] && source "$HOME/.zshrc_local"
