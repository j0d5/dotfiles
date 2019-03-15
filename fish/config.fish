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

# fish_vi_key_bindings

if test $TERM != "screen-256color"
  set -gx TERM xterm-256color
  set -gx LS_COLORS (bash -c 'eval `gdircolors ~/.dircolors`; echo $LS_COLORS')
  set -gx EXA_COLORS 'uu=0:gu=0:di=32:da=38;5;33'
end

set -gx  LC_ALL en_US.UTF-8
# }}}

# ruby configuration {{{
status --is-interactive; and source (rbenv init -|psub)
set -g fish_user_paths $fish_user_paths "$HOME/.rbenv/shims"

if test -d "$HOME/.gem/ruby/2.4.0/bin"
  set -g fish_user_paths $fish_user_paths "$HOME/.gem/ruby/2.4.0/bin"
end
# }}}

set -g fish_user_paths $fish_user_paths "/usr/local/bin" "/usr/bin" "/bin" "/usr/local/sbin" "/usr/sbin" "/sbin" "/usr/local/lib" "/usr/lib"

set -g fish_user_paths "/usr/local/opt/sqlite/bin" $fish_user_paths

if test -d $HOME/.bin
  set -g fish_user_paths $fish_user_paths "$HOME/.bin"
end

if test -d $HOME/.dev
  set -g fish_user_paths $fish_user_paths "$HOME/.dev"
end

if test -d "/Applications/Wireshark.app/Contents/MacOS"
  set -g fish_user_paths $fish_user_paths "/Applications/Wireshark.app/Contents/MacOS"
end

if test -d "/Applications/Araxis Merge.app/Contents/Utilities"
  set -g fish_user_paths $fish_user_paths "/Applications/Araxis Merge.app/Contents/Utilities"
end

if test -d "/usr/local/opt/python@2/bin"
  set -g fish_user_paths $fish_user_paths "/usr/local/opt/python@2/bin"
end

if test -d "$NPM_PACKAGES/bin"
  set -g fish_user_paths $fish_user_paths "$NPM_PACKAGES/bin"
  set -gx NPM_PACKAGES "$HOME/.npm-packages"
end

if test -d "/Applications/Xcode.app/Contents/Developer"
    set -gx DEVELOPER_DIR "/Applications/Xcode.app/Contents/Developer"
end

if test -d "/usr/local/opt/qt/bin"
  set -g fish_user_paths "/usr/local/opt/qt/bin" $fish_user_paths
end

if test -f "/usr/local/etc/grc.fish"
    source /usr/local/etc/grc.fish
end

set -l isCompanyLAN (ifconfig | grep 'inet 10.')

if test $isCompanyLAN
    echo "Connected to company LAN"
    echo "Setting proxy values"
    setProxy
end

set -gx EDITOR 'nvim'

aliases
