#! /bin/bash
ROOTDIR=$(dirname "$(realpath -s "$BASH_SOURCE")")
. "$ROOTDIR/utils/echo.sh"

for f in "$ROOTDIR"/install.d/*.sh; do
  echo -en "Do you want to run ${CYAN}$(basename "$f")?${NC} [y/N] "
  read -rn1 -p "" confirm
  echo

  [[ $confirm =~ ^([yY])$ ]] && [[ -x "$f" ]] && . "$f"

done

progress "All Done!"
