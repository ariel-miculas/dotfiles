#!/bin/bash
# Building vim
# get dependencies
set -e
curr_dir=$(pwd)

mkdir -p ~/work
cd ~/work
# clone the vim repo
(cd vim && git fetch) || (git clone https://github.com/vim/vim.git)
cd vim
git checkout v8.2.3187
make distclean
./configure --with-features=huge \
            --enable-multibyte \
            --enable-python3interp=yes \
            --with-python3-config-dir=/usr/lib/python3.5/config \
            --enable-perlinterp=yes \
            --enable-gui=gtk2 \
            --enable-gtk2-check \
            --with-x \
            --enable-cscope \
            --prefix=/usr/local
make VIMRUNTIMEDIR=/usr/local/share/vim/vim82
sudo make install

cd $curr_dir
