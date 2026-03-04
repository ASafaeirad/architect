#!/bin/bash
. "$(dirname "$BASH_SOURCE")/../utils.sh"

desktop=(
  awesome
  betterlockscreen-git
  feh
  flashfocus-git
  jcal
  nitrogen
  numlockx
  picom
  pinentry-rofi
  ranger
  rofi
  scrot
  slop
  sxhkd
  webkit2gtk
  xclip
  xdg-desktop-portal-gtk
  xdg-desktop-portal-kde
  xdotool
  xorg
  xorg-xinit
  xorg-xrandr
  xorg-xwininfo
  xsel
)

title "Installing desktop apps..."

for pkg in "${desktop[@]}"; do
  pkg_name=$(echo "$pkg" | awk '{print $1}')
  progress "Installing $pkg_name"
  paru -Sq "$pkg" --noconfirm >/dev/null
done


title "Enable dark scheme"

gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
