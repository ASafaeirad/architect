#!/bin/bash
. "$(dirname "$BASH_SOURCE")/../utils.sh"

title "Installing xf86-input-libinput"
sudo pacman -S pulseaudio pulseaudio-alsa pulseaudio-bluetooth --noconfirm > /dev/null

title "Adding user to audio group"
CURRENT_USER=$USER
sudo usermod -aG video "$CURRENT_USER"

progress "Done!"
