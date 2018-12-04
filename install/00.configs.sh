#!/bin/bash
INSTALLDIR=$(dirname "$BASH_SOURCE")
. "$INSTALLDIR/../utils/echo.sh"

configs=$( realpath "$INSTALLDIR/../configs" );

title "Installing configs"
if [ ! -d "$HOME/.config" ]; then
    progress "Creating ~/.config"
    mkdir -p "$HOME/.config"
fi

config_files=$( find "$configs" -type f 2>/dev/null )

for config in $config_files; do
    target="${config#$configs/}"

    toDir="$( dirname "$HOME/$target" )"
    from="$configs/$target"
    to="$HOME/$target"

    if [ -f "$to" ]; then
        if [ ! -d "$HOME/dotfile-backups" ]; then
          progress "Creating ~/dotfile-backups"
          mkdir -p "$HOME/dotfile-backups"
        fi

        warn "~${to} already exists... Make a Backup."
        mv "$to" "$HOME/dotfile-backups/"
    fi

    [ ! -d "$toDir" ] && mkdir -p "$toDir"

    progress "Creating symlink for $config"
    ln -sf "$from" "$to"
done

progress "Links created!"

# timedatectl set-local-rtc 1 --adjust-system-clock

