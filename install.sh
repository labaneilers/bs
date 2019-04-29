#!/bin/bash

set -e

cd $(dirname "$0")

cp ./bs ~/bin
chmod +x ~/bin/bs

echo "bs installed at ~/bin/bs"