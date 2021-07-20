#!/bin/bash
# Building vim
# get dependencies
set -e

sudo apt install -y \
    libncurses5-dev libgtk2.0-dev libatk1.0-dev libatk-adaptor \
    libcairo2-dev libx11-dev libxpm-dev libxt-dev \
    libxtst-dev libsm-dev python3-dev libperl-dev git

# call the generic script for building vim
../build-vim.sh

# make vim the default editor and map vi to vim
sudo update-alternatives --install  /usr/bin/editor editor /usr/local/bin/vim 1
sudo update-alternatives --set      editor /usr/local/bin/vim
sudo update-alternatives --install  /usr/bin/vi vi /usr/local/bin/vim 1
sudo update-alternatives --set      vi /usr/local/bin/vim
