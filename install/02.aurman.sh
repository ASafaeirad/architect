#!/bin/bash
INSTALLDIR=$(dirname "$BASH_SOURCE")
. "$INSTALLDIR/../utils/echo.sh"

if test ! "$( aurman --version )"; then
    title "Installing aurman"
    curl https://aur.archlinux.org/cgit/aur.git/snapshot/aurman.tar.gz --output /tmp/aurman.tar.gz
    tar -xvf /tmp/aurman.tar.gz  -C /tmp
    cd /tmp/aurman || exit
    makepkg -sri
fi

aurs=(
    autokey-py3
    cheat-git
    hyper
    polybar
    visual-studio-code-bin
    typora
)

title "Installing aur packages..."

for aur in "${aurs[@]}"; do
    aur_name=$( echo "$aur" | awk '{print $1}' )
    if aurman -Q "$aur_name" > /dev/null 2>&1; then
        warn "$aur_name already installed..."
    else
        progress "Installing $aur_name"
        sudo aurman -S "$aur" --noconfirm
    fi
done
