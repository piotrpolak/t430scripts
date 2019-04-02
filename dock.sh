#!/bin/bash

su pepis -c 'pkill zenity'

if [ "`prime-select query`" != "nvidia" ]
then
	su pepis -c 'zenity \
	--question \
	--ellipsize \
	--display=:0.0 \
	--text="Switch to NVIDIA graphics?\n\n Make sure your work progress is saved." \
	--title="NVIDIA Prime" \
	--ok-label="Logout and switch graphics"' && \
	prime-select nvidia && \
	service lightdm restart &
fi


