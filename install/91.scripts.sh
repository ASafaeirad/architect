#!/bin/bash
. "$(dirname "$BASH_SOURCE")/../utils/echo.sh"

title "Copy Scripts"

scriptsDir=$( realpath "$(dirname "$BASH_SOURCE")/../scripts" );
scriptFiles=$( find "$scriptsDir" -type f 2>/dev/null )

if [ ! -d "$HOME/.local/bin" ]; then
    progress "Creating ~/.local/bin"
    mkdir -p "$HOME/.local/bin"
fi

for scriptFile in $scriptFiles; do
    scriptName="$( basename "$scriptFile" )"
    binDir="$HOME/.local/bin"

    from="$scriptFile"
    to="$binDir/$scriptName"

    progress "Creating symlink for $scriptFile"
    ln -sf "$from" "$to"
done

progress "Scripts coied!"
