#! /bin/bash
xset -b
xrdb ~/.Xresources
systemctl --user import-environment DISPLAY
urxvtd -q -o -f
unclutter &
exec i3
