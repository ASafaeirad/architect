#!/bin/bash
. "$(dirname "$BASH_SOURCE")/../utils.sh"

desktop=(
  hyprland
  hyprpaperl
  wl-clipboard
  waybar-hyprland
  pipewire
  pipewire-audio
  pipewire-alsa
  grimblast
  hyprpicker
)

title "Installing desktop apps..."

for pkg in "${desktop[@]}"; do
  pkg_name=$(echo "$pkg" | awk '{print $1}')
  progress "Installing $pkg_name"
  paru -Sq "$pkg" --noconfirm > /dev/null
done
