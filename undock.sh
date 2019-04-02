#!/bin/bash

su pepis -c 'zenity \
	--question \
	--ellipsize \
	--display=:0.0 \
	--text="Switch to INTEL graphics?\n\n Make sure your work progress is saved." \
	--title="NVIDIA Prime" \
	--ok-label="Logout and switch graphics"' && \
	sudo prime-select intel && \
	service lightdm restart