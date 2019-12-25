#!/bin/bash
. "$(dirname "$BASH_SOURCE")/../utils/echo.sh"

title "Start Docker Service"
sudo usermod -aG docker
sudo systemctl enable docker.service
sudo systemctl start docker.service
progress "Docker Service is enabled"

