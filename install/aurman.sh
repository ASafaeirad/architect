#!/bin/bash

if test ! "$( aurman --version )"; then
    echo "Installing aurman"
    curl https://aur.archlinux.org/cgit/aur.git/snapshot/aurman.tar.gz --output /tmp/aurman.tar.gz
    tar -xvf /tmp/aurman.tar.gz  -C /tmp
    cd /tmp/aurman || exit
    makepkg -sri
fi

aurman -S hyper
aurman -S visual-studio-code-bin
aurman -S franz-bin
