# {{{
#
# Author: Johannes Steudle
# File: fish.config
#
# Description: fish initialization file
#
# }}}

# fish specific configuration {{{
set -g normal (set_color normal)
set -g magenta (set_color magenta)
set -g yellow (set_color yellow)
set -g green (set_color green)
set -g red (set_color red)
set -g blue (set_color -o blue)
set -g cyan (set_color -o 03FCFE)
set -g gray (set_color -o black)

set fish_color_error ff8a00

# c0 to c4 progress from dark to bright
# ce is the error colour
set -g c0 (set_color 005284)
set -g c1 (set_color 0075cd)
set -g c2 (set_color 009eff)
set -g c3 (set_color 6dc7ff)
set -g c4 (set_color ffffff)
set -g ce (set_color $fish_color_error)

fish_vi_key_bindings

if test $TERM != "screen-256color"
  set -gx TERM xterm-256color
  # set -gx LS_COLORS (bash -c 'eval `gdircolors ~/.dircolors`; echo $LS_COLORS')
  set -gx EXA_COLORS 'uu=0:gu=0:di=32:da=38;5;33'
end

set -gx LC_ALL "en_US.UTF-8"
set -gx LANGUAGE "en_US.UTF-8"
set -gx LANG "en_GB.UTF-8"
# }}}

# Clear user path
set -U fish_user_paths ""

# Ruby {{{
status --is-interactive; and source (rbenv init -|psub)
__tweetjay_addPath "$HOME/.rbenv/shims"
__tweetjay_addPath "/usr/local/opt/ruby/bin"
# }}}

# Rust {{{
__tweetjay_addPath "$HOME/.cargo/bin"
# }}}

# Set most important paths {{{
__tweetjay_addPath "/usr/local/bin" "/usr/bin" "/bin" "/usr/local/sbin" "/usr/sbin" "/sbin" "/usr/local/lib" "/usr/lib"
# }}}

# Add path for local scripts and binaries {{{
__tweetjay_addPath "$HOME/.bin"
__tweetjay_addPath "$HOME/.local/bin"
# }}}

# SQL {{{
__tweetjay_addPath "/usr/local/opt/sqlite/bin"
# }}}

# SSL {{{
__tweetjay_addPath "/usr/local/opt/openssl@1.1/bin"
# }}}

# Haskell {{{
__tweetjay_addPath "$HOME/.cabal/bin"
__tweetjay_addPath "$HOME/.ghcup/bin"
__tweetjay_addPath "$HOME/.ghcup/env"
# }}}

# Go {{{
__tweetjay_addPath "$HOME/go/bin"
# }}}

# Python {{{
__tweetjay_addPath "/usr/local/opt/python@3.9/bin"
# }}}

# NPM {{{
__tweetjay_addPath "$NPM_PACKAGES/bin"
set -U NPM_PACKAGES "$HOME/.npm-packages"
# }}}

# Wireshark {{{
__tweetjay_addPath "/Applications/Wireshark.app/Contents/MacOS"
# }}}
# Flutter {{{
__tweetjay_addPath "$HOME/Developer/flutter/bin/"
# }}}

__tweetjay_addPath "/usr/local/opt/binutils/bin"

# Xcode Developer Dir {{{
if test -d "/Applications/Xcode.app/Contents/Developer"
    set -U DEVELOPER_DIR "/Applications/Xcode.app/Contents/Developer"
end
# }}}

if test -f "/usr/local/etc/grc.fish"
    source /usr/local/etc/grc.fish
end

# talisman {{{
# Below environment variables should not be modified unless you know what you are doing
set -U TALISMAN_HOME $HOME/.talisman/bin
alias talisman=$TALISMAN_HOME/talisman_darwin_amd64
set -U TALISMAN_INTERACTIVE false
# }}}

set -U EDITOR 'nvim'

aliases

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

if test -f "$HOME/.fish_local"
    source $HOME/.fish_local
end
