#! /bin/bash
ROOTDIR=$(dirname "$(realpath -s "$BASH_SOURCE")")
. "$ROOTDIR/utils/echo.sh"

LINKS="$ROOTDIR/links";

title "Make config links"
find "$LINKS" -maxdepth 1 -type f -exec ln -sf "{}" ~/ \;
progress "Links created!"

for f in $ROOTDIR/install/*.sh; do
  . "$f"
done

progress "All Done!"
