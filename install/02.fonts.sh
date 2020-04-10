#!/bin/bash
. "$(dirname "$BASH_SOURCE")/../utils.sh"

title "Installing Fonts..."

fonts=(
  adobe-source-code-pro-fonts
  adobe-source-sans-pro-fonts
  fonts-rajdhani
  nerd-fonts-dejavu-complete
  nerd-fonts-hack
  nerd-fonts-meslo
  nerd-fonts-roboto-mono
  nerd-fonts-source-code-pro
  nerd-fonts-ubuntu-mono
  noto-fonts-emoji
  otf-exo
  persian-fonts
  terminus-font
  ttf-bitstream-vera
  ttf-courier-prime
  ttf-croscore
  ttf-dejavu
  ttf-droid
  ttf-font-awesome
  ttf-freefont
  ttf-gentium
  ttf-google-fonts-typewolf
  ttf-hack
  ttf-joypixels
  ttf-liberation
  ttf-mac-fonts
  ttf-mathtype
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
  yay -S "$font" --noconfirm
done
