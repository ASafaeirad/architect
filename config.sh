#! /bin/bash
. "$(dirname "$BASH_SOURCE")/utils.sh"

for f in "$ROOTDIR"/02.config.d/*.sh; do
  echo -en "Do you want to run ${CYAN}$(basename "$f")?${NC} [y/N] "
  read -rn1 -p "" confirm
  echo

  [[ $confirm =~ ^([yY])$ ]] && [[ -x "$f" ]] && . "$f"

done

progress "All Done!"
