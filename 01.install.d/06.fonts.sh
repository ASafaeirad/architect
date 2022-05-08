#!/bin/bash
. "$(dirname "$BASH_SOURCE")/../utils.sh"

title "Installing Fonts..."

fonts=(
  adobe-source-code-pro-fonts
  adobe-source-sans-pro-fonts
  nerd-fonts-dejavu-complete
  nerd-fonts-hack
  nerd-fonts-meslo
  nerd-fonts-roboto-mono
  nerd-fonts-source-code-pro
  nerd-fonts-ubuntu-mono
  noto-fonts
  noto-fonts-emoji
  persian-fonts
  shabnam-fonts
  terminus-font
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
  paru -Sq "$font" --noconfirm > /dev/null
done
