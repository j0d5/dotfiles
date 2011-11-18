#!/bin/sh
exec ck-launch-session gnome-session
gnome-settings-daemon &
nm-applet &
gnome-power-manager &
# gnome-volume-manager &
gnome-volume-control-applet &
# conky &
exec awesome
