#!/bin/bash
. "$(dirname "$BASH_SOURCE")/../utils/echo.sh"

title "Installing VSCode sync extension..."
code --install-extension Shan.code-settings-sync

progress "Done!"
