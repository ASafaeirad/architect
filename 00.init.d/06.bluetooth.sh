#!/bin/bash
. "$(dirname "$BASH_SOURCE")/../utils.sh"

title "Installing bluz"
sudo pacman -S bluez bluez-libs bluez-utils --noconfirm > /dev/null

progress "Done!"
