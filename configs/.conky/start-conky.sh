#!/bin/bash

if [[ $* == *--dark* ]]; then
  conky -c "$HOME/.conky/date.dark.pacsave"
  conky -c "$HOME/.conky/stats.dark.pacsave"
else
  conky -c "$HOME/.conky/stats.light.pacsave"
  conky -c "$HOME/.conky/date.light.pacsave"
fi
