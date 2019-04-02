#!/bin/bash

su pepis -c 'zenity \
	--question \
	--ellipsize \
	--display=:0.0 \
	--text="Switch to NVIDIA graphics?\n\n Make sure your work progress is saved." \
	--title="NVIDIA Prime" \
	--ok-label="Logout and switch graphics"' && \
	prime-select nvidia && \
	xrandr --output VGA-0 --auto && \
	xrandr --output LVDS-1-1 --off && \
	service lightdm restart
