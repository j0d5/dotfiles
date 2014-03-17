echo 'loading hi-z077w.hi.de.bosch.com.zsh'
# custom zsh commands
export http_proxy='http://localhost:8080'
export https_proxy='https://localhost:8080'

plugins+=(github sublime brew vagrant gradle ant python)

# start standard emulator or the emulator given in first argument
adbks() {
  if [[ -z $1 ]]; then
    adb -e emu kill && emulator -avd google_emu_18 -no-window &
  else
    adb -e emu kill && emulator -avd $1 -no-window &
  fi
}
