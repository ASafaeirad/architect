#!/bin/bash
. "$(dirname "$BASH_SOURCE")/../utils.sh"

title "Installing pipewire"
sudo pacman -Sy pipewire pipewire-alsa pipewire-pulse wireplumber --noconfirm > /dev/null

title "Adding user to audio group"
CURRENT_USER=$USER
sudo usermod -aG audio "$CURRENT_USER"

progress "Done!"
