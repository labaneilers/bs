#!/bin/bash

set -e

cd $(dirname "$0")

mkdir -p ~/bin
curl -s -o ~/bin/bs https://raw.githubusercontent.com/labaneilers/bs/master/bs
cp ./bs ~/bin
chmod +x ~/bin/bs

echo "bs installed at ~/bin/bs"