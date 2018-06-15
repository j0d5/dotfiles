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

if test $TERM != "screen-256color"
  set -gx TERM xterm-256color
end

set -gx  LC_ALL en_US.UTF-8

set -gx NPM_PACKAGES "$HOME/.npm-packages"

set -gx PATH /usr/local/bin /usr/bin /bin /usr/local/sbin /usr/sbin /sbin /usr/local/lib /usr/lib
set -gx PATH $PATH /usr/local/opt/python@2/bin
set -gx PATH $PATH /usr/local/MacGPG2/bin /Library/TeX/texbin
set -gx PATH $PATH /Applications/Wireshark.app/Contents/MacOS
set -gx PATH $PATH /Applications/Araxis\ Merge.app/Contents/Utilities
set -gx PATH $PATH $HOME/.bin $HOME/.bin/bin
set -gx PATH $PATH $HOME/.gem/ruby/2.4.0/bin $HOME/.rvm/bin
set -gx PATH $PATH "$NPM_PACKAGES/bin"

set -l isCompanyLAN (ifconfig | grep 10.34.)

if test $isCompanyLAN
    echo "Connected to company LAN"
    echo "Setting proxy values"
    setProxy
end

set -gx EDITOR 'nvim'

aliases

