#!/bin/bash
INSTALLDIR=$(dirname "$BASH_SOURCE")
. "$INSTALLDIR/../utils/echo.sh"

gist=https://gist.githubusercontent.com/frontendmonster/d2364a49c015db844a3cafb4f17a6b8c/raw/b1c5e7e9bc8391dacc4f0f3e68ef7e110cfce297/99-custom-keyboard.conf

if [ ! -f /etc/X11/xorg.conf.d/99-custom-keyboard.conf ]; then
  title "Map esc on caps..."
  sudo wget "$gist" -P /etc/X11/xorg.conf.d/
fi
