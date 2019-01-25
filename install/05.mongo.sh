#!/bin/bash
. "$(dirname "$BASH_SOURCE")/../utils/echo.sh"

title "Installing MongoDB"
sudo aurman -S mongodb

title "Start MongoDB Service"
sudo systemctl enable mongodb.service
sudo systemctl start mongodb.service
progress "MongoDB Service is enabled"

