#!/bin/bash
. "$(dirname "$BASH_SOURCE")/../utils/echo.sh"

if test ! "$( aurman --version )"; then
    title "Installing aurman"
    gpg --recv-keys 465022E743D71E39
    curl https://aur.archlinux.org/cgit/aur.git/snapshot/aurman.tar.gz --output /tmp/aurman.tar.gz
    tar -xvf /tmp/aurman.tar.gz  -C /tmp
    cd /tmp/aurman || exit
    makepkg -sri
fi

aurs=(
    autokey-py3
    cheat-git
    # hyper
    polybar
    visual-studio-code-bin
    typora
)

title "Installing aur packages..."

for aur in "${aurs[@]}"; do
    aur_name=$( echo "$aur" | awk '{print $1}' )
    if pacman -Q "$aur_name" > /dev/null 2>&1; then
        warn "$aur_name already installed..."
    else
        progress "Installing $aur_name"
        aurman -S "$aur" --noconfirm
    fi
done
