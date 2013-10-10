# test -r $ZSH_CUSTOM/hosts/$HOST.path.zsh && source $ZSH_CUSTOM/hosts/$HOST.path.zsh
# test -r $ZSH_CUSTOM/hosts/$HOST.zsh && source $ZSH_CUSTOM/hosts/$HOST.zsh
# test -r $ZSH_CUSTOM/hosts/jaybook.zsh && source $ZSH_CUSTOM/hosts/jaybook.zsh
# test -r $ZSH_CUSTOM/hosts/jaybook.path.zsh && source $ZSH_CUSTOM/hosts/jaybook.path.zsh
echo 'loading hosts.plugin.zsh on host ' $HOST
test -r $ZSH_CUSTOM/hosts/$HOST.zsh && source $ZSH_CUSTOM/hosts/$HOST.zsh
test -r $ZSH_CUSTOM/hosts/$HOST.path.zsh && source $ZSH_CUSTOM/hosts/$HOST.path.zsh
test -r $ZSH_CUSTOM/hosts/$HOST.aliases.zsh && source $ZSH_CUSTOM/hosts/$HOST.aliases.zsh

