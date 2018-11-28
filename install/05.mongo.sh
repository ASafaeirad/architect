#!/bin/bash
INSTALLDIR=$(dirname "$BASH_SOURCE")
. "$INSTALLDIR/../utils/echo.sh"

title "Start MongoDB Service"
sudo systemctl enable mongodb.service
progress "MongoDB Service enabled"

