#!/bin/sh
set -e
curr_dir=$(pwd)
sudo apt install -y build-essential cmake
sudo apt install -y python-dev python3-dev
cd ~/.vim/bundle/YouCompleteMe || exit
python3 ./install.py --clangd-completer
cd "$curr_dir"
