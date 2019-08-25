#! /bin/bash
xset -b
xrdb ~/.Xresources
systemctl --user import-environment DISPLAY
urxvtd -q -o -f
unclutter &
xset s off -dpms
exec i3
