if [[ ! $DISPLAY && $XDG_VTNR -eq 1 && ! $TMUX ]]; then
	exec startx
fi
