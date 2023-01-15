#!/bin/bash
. "$(dirname "$BASH_SOURCE")/../utils.sh"

title "Install Rustup"
curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh

progress "Done!"
