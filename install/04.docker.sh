#!/bin/bash
. "$(dirname "$BASH_SOURCE")/../utils.sh"

title "Start Docker Service"
sudo usermod -aG docker "$USER"
sudo systemctl enable docker.service
sudo systemctl start docker.service
progress "Docker Service is enabled"
