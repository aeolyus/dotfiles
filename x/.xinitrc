#! usr/bin/env bash
xset -b
xrdb ~/.Xresources
systemctl --user import-environment DISPLAY
xset s off -dpms
exec i3
