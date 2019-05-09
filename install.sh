#!/bin/bash

set -e

cd $(dirname "$0")

mkdir -p ~/bin
curl -s -o ~/bin/bs https://raw.githubusercontent.com/labaneilers/bs/master/bs
chmod +x ~/bin/bs

TESTED=$(which bs)
if [[ "$TESTED" = "" ]]; then
    echo "bs was installed at ~/bin/bs, but it wasn't on your PATH."
    exit 1
fi

echo "bs installed successfully at ~/bin/bs"