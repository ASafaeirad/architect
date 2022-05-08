#!/bin/bash
. "$(dirname "$BASH_SOURCE")/../utils.sh"

read -rn 1 -p "Update Mirrors? [y/N] " umirrors
echo

if [[ $umirrors =~ ^([Yy])$ ]]; then
  title "Update Mirrors"
  sudo pacman -Sy reflector --noconfirm
  sudo reflector --sort rate --latest 10 --save /etc/pacman.d/mirrorlist
fi

read -rn 1 -p "Sync Mirrors? [y/N] " sync
echo

if [[ $sync =~ ^([Yy])$ ]]; then
  title "Sync Mirrors"
  sudo pacman -Syu --noconfirm
fi

progress "Done!"
