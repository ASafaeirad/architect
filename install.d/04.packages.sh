#!/bin/bash
. "$(dirname "$BASH_SOURCE")/../utils.sh"

remove=(
  i3-lock
  compton
  epdfview
  palemoon-bin
  lightdm
  lightdm-slick-greeter
)

desktop=(
  blueman
  betterlockscreen-git
  capitaine-cursors
  clipit
	ruby-colorls
  conky
  dunst
  emacs
	emojify
  ffmpegthumbnailer
  flameshot
  flashfocus-git
  i3-gaps
  i3exit
  lm_sensors
  hardcore-tray
  manjaro-pulse
  mpv
  neofetch
  nitrogen
  nmap
  pavucontrol
  pass
  pass-git-helper
	browserpass
	browserpass-chromium
  perl-rename
  picom
  polybar-git
  ranger
  redshift
  slop
	tmux
  termite
  tumbler
  viewnior
  volumeicon
  wireguard-tools
  wireguard-dkms
  xorg-xwininfo
  xsensors
  xcwd-git
)

title "Installing desktop apps..."

for pkg in "${desktop[@]}"; do
  pkg_name=$(echo "$pkg" | awk '{print $1}')
  progress "Installing $pkg_name"
  paru -Sq "$pkg" --noconfirm
done

for pkg in "${remove[@]}"; do
  pkg_name=$(echo "$pkg" | awk '{print $1}')
  progress "Removing $pkg_name"
  paru -Rns "$pkg" --noconfirm
done

