#!/bin/bash
. "$(dirname "$BASH_SOURCE")/../utils.sh"

title "Generating GPG Key..."
gpg --full-gen-key

progress "GPG key successfully created"
