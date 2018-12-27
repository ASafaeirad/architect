#!/bin/bash
. "$(dirname "$BASH_SOURCE")/../utils/echo.sh"

title "Configuring timezone"
timedatectl set-local-rtc 1 --adjust-system-clock

