#!/bin/bash
set -e
sudo apt install -y build-essential cmake
sudo apt install -y python2-dev python3-dev
../install_ycm.sh
