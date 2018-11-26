#!/bin/bash
BASEDIR=$(dirname "$BASH_SOURCE")

. $BASEDIR/../utils/color.sh
. $BASEDIR/../utils/echo.sh

read -rn 1 -p "Update Mirrors? [Y/n] " umirrors

if [[ $umirrors =~ ^([Yy])$ ]]; then
    title "Update Mirrors"
    sudo pacman-mirrors --fasttrack
fi


read -rn 1 -p "Sync Mirrors? [Y/n] " sync
if [[ $sync =~ ^([Yy])$ ]]; then
title "Sync Mirrors"
sudo pacman -Syyu
fi

title "Installing pacman packages..."
formulas=(
    ack
    bat
    git
    grep
    neovim
    python
    shellcheck
    tmux
    tree
    wget
    z
    zsh
)

for formula in "${formulas[@]}"; do
    formula_name=$( echo "$formula" | awk '{print $1}' )
    if pacman -Q "$formula_name" > /dev/null 2>&1; then
        warn "$formula_name already installed..."
    else
        sudo pacman -S "$formula"
    fi
done

# after the install, install neovim python libraries
title "Running Neovim Python install"

if test ! "$( pip2 --version 2> /dev/null )"; then
    warn "Command pip2 Not Found!"
else
    pip2 install --user neovim
fi

if test ! "$( pip3 --version 2> /dev/null )"; then
    warn "Command pip3 Not Found!"
else
    pip3 install --user neovim
fi


title "Change the default shell to zsh"

zsh_path="$( which zsh )"
if ! grep "$zsh_path" /etc/shells; then
    echo "adding $zsh_path to /etc/shells"
    echo "$zsh_path" | sudo tee -a /etc/shells
fi

if [[ "$SHELL" != "$zsh_path" ]]; then
    chsh -s "$zsh_path"
    echo "default shell changed to $zsh_path"
fi
