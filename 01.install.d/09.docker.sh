#!/bin/bash
. "$(dirname "$BASH_SOURCE")/../utils.sh"

title "Installing Docker"
sudo pacman -Sq docker docker-compose --noconfirm

title "Start Docker Service"
sudo usermod -aG docker "$USER"
sudo systemctl enable docker.service
sudo systemctl start docker.service

DCP_VERSION="v0.8.0"
DCP_URL="https://github.com/docker/docker-credential-helpers/releases/download/${DCP_VERSION}/docker-credential-pass-${DCP_VERSION}.linux-amd64"

pushd "$(mktemp -d)" || exit 1
wget -O docker-credential-pass $DCP_URL
sudo mv docker-credential-pass /usr/bin/
sudo chmod +x /usr/bin/docker-credential-pass
popd || exit 1

progress "Docker Service is enabled"


