#!/bin/sh

if [ -n "$BASH_VERSION" ]; then
  if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
  fi
fi

if [ -f "$HOME/.profile" ]; then
  . "$HOME/.profile"
fi
