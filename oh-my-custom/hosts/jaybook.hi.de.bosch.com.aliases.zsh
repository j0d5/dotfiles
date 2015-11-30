echo 'loading jaybook.hi.de.bosch.com.aliases.zsh'
# general
androidSdkVersion='24.1.2'

# rsync
alias syncDocs='rsync -vrhzu --exclude-from ~/Documents/exclude.rsync ~/Documents/ /Volumes/jst2hi\$/Eigene\ Dateien/'

# ant aliases
alias antbd='ant clean debug -Dsdk.dir=/usr/local/Cellar/android-sdk/'$androidSdkVersion''
alias antbr='ant clean release -Dsdk.dir=/usr/local/Cellar/android-sdk/'$androidSdkVersion''
alias antServerSDK='(cd Source/ServerSDK && ant clean test -Dsdk.dir=/usr/local/Cellar/android-sdk/'$androidSdkVersion' && open reports/testresults/index.html)'
alias antService='(cd Source/Service && ant clean test -Dsdk.dir=/usr/local/Cellar/android-sdk/'$androidSdkVersion' && open reports/testresults/index.html)'
alias antMiniLauncher='(cd Testing/AndroidMiniLauncherApp && ant clean test -Dsdk.dir=/usr/local/Cellar/android-sdk/'$androidSdkVersion' && open reports/testresults/index.html)'
alias antTestAll='cd ~/Projects/git/mySPIN.Android.ServerSDK && setjdk 1.7 && (antServerSDK && antService && antMiniLauncher)'

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

# ssh aliases
alias sshBuildUbuntu='ssh jst2hi@bsot-build.hi.de.bosch.com'
alias sshBuildMacPro='ssh jst2hi@macproserver1.hi.de.bosch.com'
alias sshRefSys='ssh -Y johannes-ref'
