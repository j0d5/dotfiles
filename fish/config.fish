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

if [ (hostname) = "jaybook.hi.de.bosch.com" ]
    echo "Setting proxy values"
    setProxy
    echo "Set Android path values"
    setAndroidPaths
end

set -x EDITOR '/usr/local/bin/mvim'
# set -g Z_SCRIPT_PATH ~/.config/fisherman/z/conf.d/z.fish

for file in ~/.config/fish/conf.d/*.fish
    source $file
end


set -x PATH $PATH /usr/local/Cellar/git/2.9.0/share/git-core/contrib/diff-highlight/