if [[ -n $DEBUG_ZSH ]]; then
  echo 'loading hosts.plugin.zsh on host ' $HOST
fi

platform=`uname`
test -r $ZSH/hosts/$platform.zsh && source $ZSH/hosts/$platform.zsh

test -r $ZSH/hosts/$HOST.zsh && source $ZSH/hosts/$HOST.zsh
test -r $ZSH/hosts/$HOST.path.zsh && source $ZSH/hosts/$HOST.path.zsh
test -r $ZSH/hosts/$HOST.aliases.zsh && source $ZSH/hosts/$HOST.aliases.zsh
