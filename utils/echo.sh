#!/bin/bash

UTILDIR=$(dirname "$BASH_SOURCE")
. $UTILDIR/color.sh

title() {
  echo -e "\\n${CYAN}⬢ ${1}${NC}"
  echo -e "${CYAN}==============================${NC}"
}

progress() {
  echo -e "\\n${CYAN}⬢ ${1}${NC}"
}

warn() {
  echo -e "\\n${WARN}⬢ ${1}${NC}"
}

sep() {
  echo "WABN"
}
