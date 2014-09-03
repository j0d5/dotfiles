echo 'loading HI-Z0AE1.local.zsh'

plugins+=(github sublime brew vagrant gradle ant python)

# custom zsh commands

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
