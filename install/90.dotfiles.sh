#!/bin/bash
. "$(dirname "$BASH_SOURCE")/../utils/echo.sh"

title "Installing configs"

configs=$( realpath "$(dirname "$BASH_SOURCE")/../configs" );


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
        warn "~${to} already exists... Make a Backup."
        toBack="${to#$HOME/}"
        toBackDir="$( dirname "$toBack" )"
        mkdir -p "$HOME/dotfile-backups/$toBackDir"
        mv "$to" "$HOME/dotfile-backups/${toBack}"
    fi

    [ ! -d "$toDir" ] && mkdir -p "$toDir"

    progress "Creating symlink for $config"
    ln -sf "$from" "$to"
done

progress "Links created!"
