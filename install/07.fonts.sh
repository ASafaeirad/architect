#!/bin/bash
INSTALLDIR=$(dirname "$BASH_SOURCE")
. "$INSTALLDIR/../utils/echo.sh"

title "Installing Fonts"

fonts=(
  ttf-font-awesome
  adobe-source-sans-pro-fonts
  ttf-bitstream-vera
  ttf-gentium
  ttf-liberation
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

nerds=(
  nerd-fonts-complete-mono-glyphs
  nerd-fonts-roboto-mono
  nerd-fonts-source-code-pro
  nerd-fonts-ubuntu-mono
  nerd-fonts-hack
  fonts-rajdhani
  otf-exo
  vazir-fonts
)

for nerd in "${nerds[@]}"; do
    nerd_name=$( echo "$nerd" | awk '{print $1}' )
    if aurman -Q "$nerd_name" > /dev/null 2>&1; then
        warn "$nerd_name already installed..."
    else
        progress "Installing $nerd_name"
        sudo aurman -S "$nerd" --noconfirm
    fi
done
