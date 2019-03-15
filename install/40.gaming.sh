#!/bin/bash
. "$(dirname "$BASH_SOURCE")/../utils/echo.sh"

title "Installing nvidia-xrun-git"
aurman -S nvidia-xrun-git
title "Installing Steam"
sudo pacman -S steam

progress "Done!"
