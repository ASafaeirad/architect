#!/bin/bash
. "$(dirname "$BASH_SOURCE")/../utils.sh"

desktop=(
  awesome
  betterlockscreen-git
  colorpicker
  nitrogen
  picom
  pinentry-rofi
  ranger
  rofi
  slop
  sxhkd
  xdotool
  xorg
  xorg-xrandr
  xorg-xwininfo
  xsel
  feh
  flashfocus-git
)

title "Installing desktop apps..."

for pkg in "${desktop[@]}"; do
  pkg_name=$(echo "$pkg" | awk '{print $1}')
  progress "Installing $pkg_name"
  paru -Sq "$pkg" --noconfirm > /dev/null
done
