#! /bin/sh

find "$(dirname $(realpath -s $0))/root" -maxdepth 1 -type f -exec ln -s "{}" ~/ \;
