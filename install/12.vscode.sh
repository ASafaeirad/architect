#!/bin/bash
INSTALLDIR=$(dirname "$BASH_SOURCE")
. "$INSTALLDIR/../utils/echo.sh"

title "Installing VSCode sync extension..."
code --install-extension Shan.code-settings-sync
