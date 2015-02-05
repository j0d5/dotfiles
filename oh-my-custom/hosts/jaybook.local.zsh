echo 'loading jaybook.local.zsh'

plugins+=(github sublime vagrant)

## custom zsh commands
# generate a nice startup logo
/usr/local/bin/archey -c
# show message of the day
source $ZSH_CUSTOM/hosts/_motd.zsh
