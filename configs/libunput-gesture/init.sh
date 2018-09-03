#! /bin/bash

rm ~/.config/libinput-gestures.conf
ln -s "$(dirname $(realpath -s $0))/libinput-gestures.conf" ~/.config/libinput-gestures.conf

libinput-gestures-setup autostart

echo "sudo gpasswd -a $USERNAME input"
