#!/bin/bash

WARN='\033[0;33m'
CYAN='\033[1;36m'
NC='\033[0m'

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

rmexist() {
  [[ -d "$1" ]] && rm -rf "$1"
}

exists() {
  command -v "$1" >/dev/null 2>&1
}
