# general
alias top='top -o cpu -n 30'
# ant aliases
alias antbd='ant clean debug -Dsdk.dir=/Applications/android-sdk -Dndk.dir=/Applications/android-ndk-r9'
alias antbr='ant clean release -Dsdk.dir=/Applications/android-sdk -Dndk.dir=/Applications/android-ndk-r9'

# android aliases
alias andup='android update project -p .'
alias andut='android update test-project -m ../ -p .'

# adb aliases
alias adbr='adb kill-server && adb start-server'
alias adbk='adb -e emu kill'

# ssh aliases
alias sshBuildUbuntu='ssh jst2hi@bsot-build.hi.de.bosch.com'
alias sshBuildMacPro='ssh jst2hi@macproserver1.hi.de.bosch.com'

# start standard emulator or the emulator given in first argument
adbks() {
  if [[ -z $1 ]]; then
    adb -e emu kill && emulator -avd google_emu_18 -no-window &
  else
    adb -e emu kill && emulator -avd $1 -no-window &
  fi
}

