#!/bin/bash
. "$(dirname "$BASH_SOURCE")/../utils.sh"

title "Installing mesa"
sudo pacman -S mesa --noconfirm > /dev/null

title "light"
sudo pacman -S light --noconfirm > /dev/null

title "Adding user to video group"
sudo usermod -aG video "$USER"

# https://wiki.archlinux.org/title/backlight
title "Adding udev rules"
sudo tee /etc/udev/rules.d/backlight.rules > /dev/null <<'_EOF'
RUN+="/bin/chgrp video /sys/class/backlight/intel_backlight/brightness"
RUN+="/bin/chmod g+w /sys/class/backlight/intel_backlight/brightness"
_EOF

progress "Done!"
