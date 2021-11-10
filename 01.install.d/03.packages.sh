#!/bin/bash
. "$(dirname "$BASH_SOURCE")/../utils.sh"

desktop=(
  alacritty
  betterlockscreen-git
  blueman
  bluez
  bluez-libs
  bluez-utils
  browserpass
  browserpass-chromium
  capitaine-cursors
  clipit
  dunst
  dunstify
  emacs
  emojify
  ffmpegthumbnailer
  flameshot
  flashfocus-git
  flat-remix
  flat-remix-gtk
  feh
  fx
  hardcode-tray
  i3-gaps
  i3-scripts
  i3exit
  lm_sensors
  manjaro-pulse
  mpv
  neofetch
  nitrogen
  nmap
  papirus-icon-theme
  pass
  pass-git-helper
  pavucontrol
  perl-rename
  picom
  polybar-git
  ranger
  redshift
  ruby-colorls
  slop
  tumbler
  viewnior
  volumeicon
  wireguard-dkms
  wireguard-tools
  wireless_tools
  xcursor-breeze
  xorg-xrandr
  xorg-xwininfo
  xsel
  xsensors
)

title "Installing desktop apps..."

for pkg in "${desktop[@]}"; do
  pkg_name=$(echo "$pkg" | awk '{print $1}')
  progress "Installing $pkg_name"
  paru -Sq "$pkg" --noconfirm
done
