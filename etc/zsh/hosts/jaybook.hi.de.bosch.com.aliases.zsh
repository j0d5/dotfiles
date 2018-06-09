##################################################
##                                              ##
## Author: Johannes Steudle                     ##
## File: jaybook.hi.de.bosch.com.aliases.zsh    ##
## Date: 03.12.2015                             ##
##                                              ##
## Description: file for host specific aliases  ##
##                                              ##
##################################################

if [[ -n $DEBUG_ZSH ]]; then
  echo 'loading jaybook.hi.de.bosch.com.aliases.zsh'
fi

# general
alias cleanBaks='find . -type f -name \*.orig -exec rmtrash "{}" +'
alias cleanBuild='find . -type d -name build -exec rmtrash -r "{}" +'

# ssh aliases
alias sshRefSys='ssh -Y johannes-ref'
