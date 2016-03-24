##################################################
##                                              ##
## Author: Johannes Steudle                     ##
## File: macproserver.local.aliases.zsh         ##
## Date: 03.12.2015                             ##
##                                              ##
## Description: file for host specific aliases  ##
##                                              ##
##################################################


# adb aliases
alias adbr='adb kill-server && adb start-server'
alias adbk='adb -e emu kill'

# start standard emulator or the emulator given in first argument
adbks() {
	if [[ -z $1 ]]; then
		adb -e emu kill && emulator -avd google_emu_18 -no-window &
	else
		adb -e emu kill && emulator -avd $1 -no-window &
	fi
}
