echo 'loading jaybook.hi.de.bosch.com.aliases.zsh'
# general

# ant aliases
alias antbd='ant clean debug -Dsdk.dir=/usr/local/Cellar/android-sdk/24.0.2'
alias antbr='ant clean release -Dsdk.dir=/usr/local/Cellar/android-sdk/24.0.2'
alias antServerSDK='(cd Source/ServerSDK && ant clean test -Dsdk.dir=/usr/local/Cellar/android-sdk/24.0.2 && open reports/testresults/index.html)'
alias antService='(cd Source/Service && ant clean test -Dsdk.dir=/usr/local/Cellar/android-sdk/24.0.2 && open reports/testresults/index.html)'

# android aliases
alias andup='android update project -p .'
alias andut='android update test-project -m ../ -p .'
alias package="aapt dump badging $* | grep package | awk '{print $2}' | sed s/name=//g | sed s/\'//g"
alias activity="aapt dump badging $* | grep Activity | awk '{print $2}' | sed s/name=//g | sed s/\'//g"

# adb aliases
alias adbr='adb kill-server && adb start-server'
alias adbk='adb -e emu kill'

# ssh aliases
alias sshBuildUbuntu='ssh jst2hi@bsot-build.hi.de.bosch.com'
alias sshBuildMacPro='ssh jst2hi@macproserver1.hi.de.bosch.com'
alias sshRefSys='ssh -Y johannes-ref'
