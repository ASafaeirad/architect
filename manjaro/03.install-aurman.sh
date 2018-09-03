#! /bin/sh

curl https://aur.archlinux.org/cgit/aur.git/snapshot/aurman.tar.gz --output /tmp/aurman.tar.gz
tar -xvf /tmp/aurman.tar.gz  -C /tmp
cd /tmp/aurman
makepkg -sri
