#!/bin/bash
. "$(dirname "$BASH_SOURCE")/../utils.sh"

desktop=(
  betterlockscreen
  blueman
  browserpass
  browserpass-chromium
  capitaine-cursors
  clipit
  conky
  dunst
  emacs
  emojify
  ffmpegthumbnailer
  flameshot
  flashfocus-git
  fx
  hardcore-tray
  i3-gaps
  i3exit
  lm_sensors
  manjaro-pulse
  mpv
  neofetch
  nitrogen
  nmap
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
  termite
  tumbler
  viewnior
  volumeicon
  wireguard-dkms
  wireguard-tools
  xcwd-git
  xorg-xwininfo
  xsensors
)

title "Installing desktop apps..."

for pkg in "${desktop[@]}"; do
  pkg_name=$(echo "$pkg" | awk '{print $1}')
  progress "Installing $pkg_name"
  paru -Sq "$pkg" --noconfirm
done
