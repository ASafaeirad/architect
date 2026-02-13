#!/bin/bash
. "$(dirname "$BASH_SOURCE")/../utils.sh"

desktop=(
  lxappearance
  alacritty
  bat
  copyq
  curlie
  emojify
  ffmpegthumbnailer
  flameshot
  mpv
  pass
  pass-git-helper
  pass-otp
  redshift
  ranger
  capitaine-cursors
  flat-remix
  flat-remix-gtk
  gnome-keyring
  papirus-icon-theme
  pavucontrol
  tumbler
  exa
  kvantum
  termdown
  tesseract
  tesseract-data-eng
)

title "Installing desktop apps..."

for pkg in "${desktop[@]}"; do
  pkg_name=$(echo "$pkg" | awk '{print $1}')
  progress "Installing $pkg_name"
  paru -Sq "$pkg" --noconfirm >/dev/null
done
