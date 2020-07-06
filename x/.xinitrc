#! usr/bin/env bash
xset -b
xrdb ~/.Xresources
systemctl --user import-environment DISPLAY
xset s off -dpms
# dwmblocks &
# while dwm; do autorandr -c && ~/.fehbg ; done;
exec i3
