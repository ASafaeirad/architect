#!/bin/bash
. "$(dirname "$BASH_SOURCE")/../utils.sh"

title "Installing Docker"
sudo pacman -Sq docker docker-compose --noconfirm

title "Start Docker Service"
sudo usermod -aG docker "$USER"
sudo systemctl enable docker.service
sudo systemctl start docker.service

DCP_VERSION="v0.6.4"
DCP_CLIENT="pass"
DCP_URL="https://github.com/docker/docker-credential-helpers/releases/download/${DCP_VERSION}/docker-credential-${DCP_CLIENT}-${DCP_VERSION}-amd64.tar.gz"

pushd "$(mktemp -d)" || exit 1
wget -O dcp.tar.gz $DCP_URL
tar -xvf dcp.tar.gz
sudo mv docker-credential-pass /usr/bin/
sudo chmod +x /usr/bin/docker-credential-pass
popd || exit 1

progress "Docker Service is enabled"


