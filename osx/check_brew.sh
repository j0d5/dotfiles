#!/bin/bash
if [ -n "$(command -v brew)" ]; then
	curl -fsSo "$TMPDIR"/brew-install.rb https://raw.githubusercontent.com/Homebrew/install/master/install
	/usr/bin/ruby "$TMPDIR"/brew-install.rb
fi
