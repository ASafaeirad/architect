#!/bin/bash
. "$(dirname "$BASH_SOURCE")/../utils.sh"

title "Installing nvidia prime driver..."
mhwd -i pci video-hybrid-intel-nvidia-prime

progress "Done!"
