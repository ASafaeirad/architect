#!/bin/bash
read -rn 1 -p "Update Mirrors? [y/N] " umirrors
echo

if [[ $umirrors =~ ^([Yy])$ ]]; then
  title "Update Mirrors"
  sudo pacman-mirrors --fasttrack
fi

read -rn 1 -p "Sync Mirrors? [y/N] " sync
echo

if [[ $sync =~ ^([Yy])$ ]]; then
  title "Sync Mirrors"
  sudo pacman -Syu --noconfirm
fi

