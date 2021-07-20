#!/bin/bash
set -e
curr_dir=$(pwd)
cd ~/.vim/bundle/YouCompleteMe || exit
python3 ./install.py --clangd-completer
cd "$curr_dir"
