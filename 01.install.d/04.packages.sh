#!/bin/bash
. "$(dirname "$BASH_SOURCE")/../utils.sh"

desktop=(
  lxappearance
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
  pass-otp
  redshift
  colorpicker
  ranger
  vimiv
  capitaine-cursors
  flat-remix
  flat-remix-gtk
  gnome-keyring
  papirus-icon-theme
  pavucontrol
  tumbler
  exa
  kvantum
  brillo
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
