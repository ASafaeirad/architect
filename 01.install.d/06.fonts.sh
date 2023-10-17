#!/bin/bash
. "$(dirname "$BASH_SOURCE")/../utils.sh"

title "Installing Fonts..."

fonts=(
  adobe-source-code-pro-fonts
  adobe-source-sans-pro-fonts
  ttf-dejavu-nerd
  ttf-hack-nerd
  ttf-meslo-nerd
  ttf-roboto-mono-nerd
  ttf-sourcecodepro-nerd
  ttf-ubuntu-mono-nerd
  noto-fonts
  noto-fonts-emoji
  persian-fonts
  shabnam-fonts
  terminus-font
  ttf-cascadia-code
  ttf-courier-prime
  ttf-droid
  ttf-font-awesome
  ttf-freefont
  ttf-input
  ttf-liberation
  ttf-mac-fonts
  ttf-monaco
  ttf-ms-fonts
  ttf-oxygen-gf
  ttf-roboto
  ttf-yosemite-san-francisco-font-git
  vazir-fonts
)

for font in "${fonts[@]}"; do
  font_name=$(echo "$font" | awk '{print $1}')
  progress "Installing $font_name"
  paru -Sq "$font" --noconfirm >/dev/null
done
