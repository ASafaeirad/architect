#!/bin/bash
. "$(dirname "$BASH_SOURCE")/../utils/echo.sh"

title "Installing Fonts..."

fonts=(
  adobe-source-sans-pro-fonts
  terminus-font
  ttf-bitstream-vera
  ttf-croscore
  ttf-dejavu
  ttf-droid
  ttf-font-awesome
  ttf-freefont
  ttf-gentium
  ttf-liberation
)

aurfonts=(
  fonts-rajdhani
  persian-fonts
  nerd-fonts-complete-mono-glyphs
  nerd-fonts-dejavu-complete
  nerd-fonts-hack
  nerd-fonts-roboto-mono
  nerd-fonts-source-code-pro
  nerd-fonts-ubuntu-mono
  otf-exo
  ttf-emojione
  ttf-google-fonts-typewolf
  ttf-mac-fonts
  ttf-mathtype
  ttf-monaco
  ttf-ms-fonts
  ttf-oxygen-gf
  ttf-yosemite-san-francisco-font-git
  vazir-fonts
)

for font in "${fonts[@]}"; do
    font_name=$( echo "$font" | awk '{print $1}' )
    if pacman -Q "$font_name" > /dev/null 2>&1; then
        warn "$font_name already installed..."
    else
        proccess "Installing $font_name"
        sudo pacman -S "$font"
    fi
done

for nerd in "${aurfonts[@]}"; do
    nerd_name=$( echo "$nerd" | awk '{print $1}' )
    if pacman -Q "$nerd_name" > /dev/null 2>&1; then
        warn "$nerd_name already installed..."
    else
        progress "Installing $nerd_name"
        aurman -S "$nerd" --noconfirm
    fi
done
