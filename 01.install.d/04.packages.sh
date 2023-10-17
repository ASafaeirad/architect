#!/bin/bash
. "$(dirname "$BASH_SOURCE")/../utils.sh"

desktop=(
  alacritty
  bat
  browserpass
  browserpass-chromium
  copyq
  curlie
  emojify
  ffmpegthumbnailer
  flameshot
  mpv
  pass
  pass-git-helper
  redshift
  colorpicker
  ranger
  vimiv
  capitaine-cursors
  flat-remix-gtk
  gnome-keyring
  papirus-icon-theme
  pavucontrol
  tumbler
  exa
  kvantum
)

title "Installing desktop apps..."
t
for pkg in "${desktop[@]}"; do
  pkg_name=$(echo "$pkg" | awk '{print $1}')
  progress "Installing $pkg_name"
  paru -Sq "$pkg" --noconfirm > /dev/null
done
