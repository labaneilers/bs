#!/bin/bash

cd $(dirname "$0")

if [ "$BS_DIR" = "" ]; then
    BS_DIR="~/bin"
fi

BS_BIN_PATH="$BS_DIR/bs"

mkdir -p ~/bin
curl -s -f -S -o "$BS_BIN_PATH" https://raw.githubusercontent.com/labaneilers/bs/master/bs
ERROR="$?"
if [ ! "$ERROR" = "0" ]; then
    echo "Failed to download"
    exit 1
fi

chmod +x "$BS_BIN_PATH"

TESTED=$(which bs)
if [[ "$TESTED" = "" ]]; then
    echo "bs was installed at $BS_BIN_PATH, but it wasn't on your PATH."
    exit 1
fi

echo "bs installed successfully at $BS_BIN_PATH"