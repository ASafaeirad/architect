#!/bin/bash
. "$(dirname "$BASH_SOURCE")/../utils/echo.sh"

title "Install Redis"
sudo pacman -S redis

title "Starting Redis Service"
sudo systemctl enable redis.service
sudo systemctl start redis.service

process "Redis Service is enabled"
