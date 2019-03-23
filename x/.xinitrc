#! /bin/bash
xset -b
xrdb ~/.Xresources
systemctl --user import-environment DISPLAY
exec i3
