#!/bin/bash
. "$(dirname "$BASH_SOURCE")/../utils.sh"

title "Install Virtualbox"
sudo pacman -Sq virtualbox --noconfirm

sudo usermod -aG vboxusers $USER
sudo vboxreload

progress "Done!"
