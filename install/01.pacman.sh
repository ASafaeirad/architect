#!/bin/bash
. "$(dirname "$BASH_SOURCE")/../utils/echo.sh"

read -rn 1 -p "Update Mirrors? [y/N] " umirrors
echo

if [[ $umirrors =~ ^([Yy])$ ]]; then
    title "Update Mirrors"
    sudo pacman-mirrors --fasttrack
fi


read -rn 1 -p "Sync Mirrors? [y/N] " sync
echo
if [[ $sync =~ ^([Yy])$ ]]; then
    title "Sync Mirrors"
    sudo pacman -Syyu
fi

title "Installing pacman packages..."
desktops=(
    i3-gaps
    i3exit
    capitaine-cursors
    compton
    conky
    dunst
    net-tools
    bind-tools
    numlockx
)

formulas=(
    ack
    anydesk
    bat
    blueman
    chromium
    docker
    vscodium-bin
    flameshot
    gcc
    gimp
    git
    grep
    neovim
    peek
    persepolis-git
    python
    ranger
    redshift
    shellcheck
    telegram-desktop
    termite
    nemo
    tmux
    tree
    unrar
    unzip
    vlc
    wget
    yarn
    z
    zip
    zsh

    tumbler
    ffmpegthumbnailer
)

for formula in "${formulas[@]}"; do
    formula_name=$( echo "$formula" | awk '{print $1}' )
    if pacman -Q "$formula_name" > /dev/null 2>&1; then
        warn "$formula_name already installed..."
    else
        progress "Installing $formula_name"
        sudo pacman -S "$formula" --noconfirm
    fi
done

for desktop in "${desktops[@]}"; do
    desktop_name=$( echo "$desktop" | awk '{print $1}' )
    if pacman -Q "$desktop_name" > /dev/null 2>&1; then
        warn "$desktop_name already installed..."
    else
        progress "Installing $desktop_name"
        sudo pacman -S "$desktop" --noconfirm
    fi
done

title "Clean the nonneeded packages..."
sudo pacman -Rns "$(pacman -Qtdq)"
