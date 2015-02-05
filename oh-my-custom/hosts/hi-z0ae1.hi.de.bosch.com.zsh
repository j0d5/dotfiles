echo 'loading HI-Z0AE1.local.zsh'

plugins+=(github sublime brew vagrant gradle ant python)

# custom zsh commands
export http_proxy='http://localhost:8080'
export https_proxy='https://localhost:8080'
export ANDROID_NDK_HOME='/usr/local/Cellar/android-ndk/r10d'

# generate a nice startup logo
/usr/local/bin/archey -c

# start standard emulator or the emulator given in first argument
adbks() {
  if [[ -z $1 ]]; then
    adb -e emu kill && emulator -avd google_emu_18 -no-window &
  else
    adb -e emu kill && emulator -avd $1 -no-window &
  fi
}
