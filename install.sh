#!/bin/bash

cd $(dirname "$0")

mkdir -p ~/bin
curl -s -f -S -o ~/bin/bs https://raw.githubusercontent.com/labaneilers/bs/master/bs
ERROR="$?"
if [ ! "$ERROR" = "0" ]; then
    echo "Failed to download"
    exit 1
fi

chmod +x ~/bin/bs

TESTED=$(which bs)
if [[ "$TESTED" = "" ]]; then
    echo "bs was installed at ~/bin/bs, but it wasn't on your PATH."
    exit 1
fi

echo "bs installed successfully at ~/bin/bs"