#!/bin/bash
. "$(dirname "$BASH_SOURCE")/../utils.sh"

title "Installing nvidia-intel bumblebee driver..."
mhwd -i pci video-hybrid-intel-nvidia-430xx-bumblebee

progress "Done!"
