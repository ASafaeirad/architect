#!/bin/bash
. "$(dirname "$BASH_SOURCE")/../utils.sh"

title "Remove extra software"
remove=(
  i3-lock
  compton
  epdfview
  palemoon-bin
  lightdm
  lightdm-slick-greeter
)

for pkg in "${remove[@]}"; do
  pkg_name=$(echo "$pkg" | awk '{print $1}')
  progress "Removing $pkg_name"
  paru -Rns "$pkg" --noconfirm
done
