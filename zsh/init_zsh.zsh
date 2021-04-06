# {{{
#
# Author: Johannes Steudle
# File: init_zsh.zsh
#
# Description: file for global settings
#
# }}}

if [[ -n $DEBUG_ZSH ]]; then
  echo 'loading init_zsh'
fi

# Load all stock functions (from $fpath files) called below.
autoload -Uz compaudit compinit

: ${ZSH_DISABLE_COMPFIX:=true}

# add a function path
# fpath=($ZSH/functions $ZSH/completions $fpath)

# is_plugin() {
#   local base_dir=$1
#   local name=$2
#   test -f $base_dir/plugins/$name/$name.plugin.zsh \
#     || test -f $base_dir/plugins/$name/_$name
# }

# Add all defined plugins to fpath. This must be done before running compinit.
# for plugin ($plugins); do
#   if is_plugin $ZSH $plugin; then
#     if [[ -n $DEBUG_ZSH ]]; then
#       echo "Load plugin $plugin"
#     fi
#     fpath=($ZSH/plugins/$plugin $fpath)
#   fi
# done

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

# Save the location of the current completion dump file.
if [ -z "$ZSH_COMPDUMP" ]; then
  ZSH_COMPDUMP="${ZDOTDIR:-${HOME}}/.zcompdump-${SHORT_HOST}-${ZSH_VERSION}"
fi

if [[ $ZSH_DISABLE_COMPFIX != true ]]; then
  # If completion insecurities exist, warn the user without enabling completions.
  if ! compaudit &>/dev/null; then
    # This function resides in the "lib/compfix.zsh" script sourced above.
    handle_completion_insecurities
  # Else, enable and cache completions to the desired file.
  else
    compinit -d "${ZSH_COMPDUMP}"
  fi
else
  compinit -i -d "${ZSH_COMPDUMP}"
fi

# Load the theme
source "$ZSH/themes/$ZSH_THEME/$ZSH_THEME.zsh-theme"

# Load completion for kubectl
if ! type "$kubectl" > /dev/null; then
  source <(kubectl completion zsh)
fi

# Load completion for helm
if ! type "$helm" > /dev/null; then
  source <(helm completion zsh)
fi

# PyEnv
eval "$(pyenv init -)"
