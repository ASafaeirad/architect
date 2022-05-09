#!/bin/bash
. "$(dirname "$BASH_SOURCE")/../utils.sh"

title "Installing xf86-input-libinput"
sudo pacman -S bluez bluez-libs bluez-utils --noconfirm > /dev/null

progress "Done!"
