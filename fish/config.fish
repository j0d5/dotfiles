#
# fish initialization file
#

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
  set -gx LS_COLORS (bash -c 'eval `gdircolors ~/.dircolors`; echo $LS_COLORS')
  set -gx EXA_COLORS 'uu=0:gu=0:di=32:da=38;5;33'
end

set -gx  LC_ALL en_US.UTF-8
# }}}

# Clear user path
set -U fish_user_paths ""

# ruby configuration {{{
status --is-interactive; and source (rbenv init -|psub)
set -U fish_user_paths $fish_user_paths "$HOME/.rbenv/shims"
set -U fish_user_paths $fish_user_paths "$HOME/.rbenv/bin"
set -U fish_user_paths $fish_user_paths "/usr/local/opt/ruby/bin"
# }}}

set -U fish_user_paths $fish_user_paths "/usr/local/bin" "/usr/bin" "/bin" "/usr/local/sbin" "/usr/sbin" "/sbin" "/usr/local/lib" "/usr/lib"
set -U fish_user_paths $fish_user_paths "/usr/local/opt/sqlite/bin"

# Add path for local scripts and binaries {{{
if test -d "$HOME/.bin"
  set -U fish_user_paths $fish_user_paths "$HOME/.bin"
else
  echo "Invalid path for .bin!"
end

if test -d "$HOME/.local/bin"
  set -U fish_user_paths $fish_user_paths "$HOME/.local/bin"
else
  echo "Invalid path for .local/bin!"
end

if test -d "$HOME/.dev"
  set -U fish_user_paths $fish_user_paths "$HOME/.dev"
else
  echo "Invalid path for .dev!"
end
# }}}

# Haskell language {{{
if test -d "$HOME/.cabal/bin"
  set -U fish_user_paths $fish_user_paths "$HOME/.cabal/bin"
end
if test -d "$HOME/.ghcup/bin"
  set -U fish_user_paths $fish_user_paths "$HOME/.ghcup/bin"
end
if test -d "$HOME/.ghcup/env"
  set -U fish_user_paths $fish_user_paths "$HOME/.ghcup/env"
end
# }}}

# Go language {{{
if test -d "$HOME/go/bin"
  set -U fish_user_paths $fish_user_paths "$HOME/go/bin"
else
  echo "Invalid path for go!"
end
# }}}

if test -d "/Applications/Wireshark.app/Contents/MacOS"
  set -U fish_user_paths $fish_user_paths "/Applications/Wireshark.app/Contents/MacOS"
else
  echo "Wireshark does not seem to be installed!"
end

if test -d "/Applications/Araxis Merge.app/Contents/Utilities"
  set -U fish_user_paths $fish_user_paths "/Applications/Araxis Merge.app/Contents/Utilities"
else
  echo "Araxis does not seem to be installed!"
end

if test -d "/usr/local/opt/python@2/bin"
  set -U fish_user_paths $fish_user_paths "/usr/local/opt/python@2/bin"
end

if test -d "$NPM_PACKAGES/bin"
  set -U fish_user_paths $fish_user_paths "$NPM_PACKAGES/bin"
  set -U NPM_PACKAGES "$HOME/.npm-packages"
end

if test -d "/Applications/Xcode.app/Contents/Developer"
    set -U DEVELOPER_DIR "/Applications/Xcode.app/Contents/Developer"
else
  echo "Xcode does not seem to be installed!"
end

if test -f "/usr/local/etc/grc.fish"
    source /usr/local/etc/grc.fish
end

set -l isCompanyLAN (ifconfig | grep 'inet 10.')

if test -n "$isCompanyLAN"
    echo "Connected to company LAN"
    echo "Setting proxy values"
    setProxy
end

set -U EDITOR 'nvim'

aliases

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
