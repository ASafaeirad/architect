#!/bin/bash
. "$(dirname "$BASH_SOURCE")/../utils/echo.sh"

if test ! "$(yay --version)"; then
    title "Installing yay"
    mkdir -p /tmp/yay
    git clone https://aur.archlinux.org/yay.git /tmp/yay
    cd /tmp/yay || exit
    makepkg -si
fi

aurs=(
    polybar-git
    betterlockscreen-git
    cheat-git
    flasfocus-git
    insomnia
    polybar-git
    typora
    tor-browser
)

title "Installing aur packages..."

for aur in "${aurs[@]}"; do
    aur_name=$(echo "$aur" | awk '{print $1}')
    if yay -Q "$aur_name" >/dev/null 2>&1; then
        warn "$aur_name already installed..."
    else
        progress "Installing $aur_name"
        yay -S "$aur" --noconfirm
    fi
done
