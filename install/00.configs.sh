#!/bin/bash
INSTALLDIR=$(dirname "$BASH_SOURCE")
. "$INSTALLDIR/../utils/echo.sh"

configs="$INSTALLDIR/../configs";


title "Installing configs"
if [ ! -d "$HOME/.config" ]; then
    progress "Creating ~/.config"
    mkdir -p "$HOME/.config"
fi

config_files=$( find "$(realpath "$configs")" -type f 2>/dev/null )

for config in $config_files; do
    target="$HOME/$( basename "$config" )"

    if [ -f "$target" ]; then
        if [ ! -d "$HOME/dotfile-backups" ]; then
          progress "Creating ~/dotfile-backups"
          mkdir -p "$HOME/dotfile-backups"
        fi

        warn "~${target#$HOME} already exists... Make a Backup."
        mv "$target" "$HOME/dotfile-backups/"
    fi
    progress "Creating symlink for $config"
    ln -s "$config" "$target"
done

progress "Links created!"
