#! /bin/bash
ROOT_DIR=$(dirname "$BASH_SOURCE")
. "$ROOT_DIR/utils.sh"

for f in "$ROOT_DIR"/00.init.d/*.sh; do
  echo -en "Do you want to run ${CYAN}$(basename "$f")?${NC} [y/N] "
  read -rn1 -p "" confirm
  echo
  [[ $confirm =~ ^([yY])$ ]] && [[ -x "$f" ]] && . "$f"
done

progress "All Done!"
