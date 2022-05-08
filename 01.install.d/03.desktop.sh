#!/bin/bash
. "$(dirname "$BASH_SOURCE")/../utils.sh"

desktop=(
  awesome
  betterlockscreen-git
  capitaine-cursors
  flat-remix
  nitrogen
  papirus-icon-theme
  pavucontrol
  picom
  ranger
  rofi
  slop
  tumbler
  xf86-input-synaptics
  xorg
  xorg-xrandr
  xorg-xwininfo
  xsel
)

title "Installing desktop apps..."

for pkg in "${desktop[@]}"; do
  pkg_name=$(echo "$pkg" | awk '{print $1}')
  progress "Installing $pkg_name"
  paru -Sq "$pkg" --noconfirm > /dev/null
done
