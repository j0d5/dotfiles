##################################################
##                                              ##
## Author: Johannes Steudle                     ##
## File: jaybook.hi.de.bosch.com.aliases.zsh    ##
## Date: 03.12.2015                             ##
##                                              ##
## Description: file for host specific aliases  ##
##                                              ##
##################################################

# echo 'loading jaybook.hi.de.bosch.com.aliases.zsh'

# general
androidSdkVersion='24.1.2'

# rsync
alias syncDocs='rsync -vrhzu --exclude-from ~/Documents/exclude.rsync ~/Documents/ /Volumes/jst2hi\$/Eigene\ Dateien/'

# android aliases
alias andup='android update project -p .'
alias andut='android update test-project -m ../ -p .'
alias package="aapt dump badging $* | grep package | awk '{print $2}' | sed s/name=//g | sed s/\'//g"
alias activity="aapt dump badging $* | grep Activity | awk '{print $2}' | sed s/name=//g | sed s/\'//g"

# adb aliases
alias adbr='adb kill-server && adb start-server'
alias adbk='adb -e emu kill'

# gradle
alias cleanBuild='find . -type d -name build -exec rm -r {} +'
alias buildSdk='gradle :Source:Service:clean :Source:ServerSDK:clean :Source:Service:build :Source:ServerSDK:build'
alias buildMini='gradle :Testing:AudioManagementTest:clean :Testing:AudioManagementTest:build'

# ssh aliases
alias sshBuildUbuntu='ssh jst2hi@bsot-build.hi.de.bosch.com'
alias sshBuildMacPro='ssh jst2hi@macproserver1.hi.de.bosch.com'
alias sshRefSys='ssh -Y johannes-ref'
