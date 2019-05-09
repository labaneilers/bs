#!/bin/bash

set -e

cd $(dirname "$0")

mkdir -p ~/bin
curl -s -o ~/bin/bs https://gitcdn.link/repo/labaneilers/bs/master/bs
cp ./bs ~/bin
chmod +x ~/bin/bs

echo "bs installed at ~/bin/bs"