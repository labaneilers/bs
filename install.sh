#!/bin/bash

set -e

cd $(dirname "$0")

mkdir -p ~/bin
cp ./bs ~/bin
chmod +x ~/bin/bs

echo "bs installed at ~/bin/bs"