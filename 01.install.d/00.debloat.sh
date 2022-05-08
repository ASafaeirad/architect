#!/bin/bash
. "$(dirname "$BASH_SOURCE")/../utils.sh"

title "Remove extra software"
remove=(
  arandr
  b43-fwcutter
  bmenu
  crda
  cronie
  dfc
  epdfview
  i3-help
  i3-lock
  i3-scrot
  i3lock-color
  lib32-vulkan-radeon
  lightdm
  lightdm-slick-greeter
  maia-console
  manjaro-i3-settings
  manjaro-zsh-config
  palemoon-bin
  pamac
  pamac-gtk
  vi
  vim
  vulkan-radeon
)

for pkg in "${remove[@]}"; do
  pkg_name=$(echo "$pkg" | awk '{print $1}')
  if pacman -Qi "$pkg" &>/dev/null ; then
    progress "Removing $pkg_name"
    sudo pacman -Rns "$pkg" --noconfirm > /dev/null
  fi
done
