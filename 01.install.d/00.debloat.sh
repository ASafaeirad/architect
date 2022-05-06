#!/bin/bash
. "$(dirname "$BASH_SOURCE")/../utils.sh"

title "Remove extra software"
remove=(
  i3-lock
  i3lock-color
  epdfview
  palemoon-bin
  lightdm
  lightdm-slick-greeter
  pamac
  pamac-gtk
  bmenu
  vi
  vim
  vulkan-radeon
  arandr
  b43-fwcutter
  crda
  cronie
  dfc
  lib32-vulkan-radeon
  maia-console
  manjaro-i3-settings
  manjaro-zsh-config
  i3-help
  i3-scrot
)

for pkg in "${remove[@]}"; do
  pkg_name=$(echo "$pkg" | awk '{print $1}')
  if pacman -Qi "$pkg" &>/dev/null ; then
    progress "Removing $pkg_name"
    sudo pacman -Rns "$pkg" --noconfirm
  fi
done
