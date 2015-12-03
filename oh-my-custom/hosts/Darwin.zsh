##################################################
##                                              ##
## Author: Johannes Steudle                     ##
## File: Darwin.zsh                             ##
## Date: 03.12.2015                             ##
##                                              ##
## Description: file for platform specific      ##
##              settings                        ##
##                                              ##
##################################################

# custom zsh commands
echo "i'm on a darwin system!"
# general
alias top='top -o cpu -n 30'
alias downtime='pmset -g log | grep -e " Sleep  " -e " Wake  "'
alias pf="open -a \"Path Finder.app\""
alias bu="brew update && brew upgrade --all && brew cleanup"

# android paths
androidSdkVersion=24.3.3
androidBuildToolsVersion=22.0.1
androidNdkVersion=r10e
export ANDROID_HOME=/usr/local/Cellar/android-sdk/$androidSdkVersion
export PATH=$PATH:/usr/local/Cellar/android-sdk/$androidSdkVersion/bin
export PATH=$PATH:/usr/local/Cellar/android-sdk/$androidSdkVersion/tools
export PATH=$PATH:/usr/local/Cellar/android-sdk/$androidSdkVersion/platform-tools
export PATH=$PATH:/usr/local/Cellar/android-sdk/$androidSdkVersion/build-tools/$androidBuildToolsVersion
export PATH=$PATH:/usr/local/Cellar/android-ndk/$androidNdkVersion
