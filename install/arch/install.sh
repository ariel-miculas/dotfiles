#!/bin/bash
# This script compiles vim from sources and installs other useful programs
set -e

# First install the required dependencies
./arch_install.sh

# colorschemes for the terminal
../get-base16-colorschemes.sh

# fonts for the terminal (used by vim)
../../fonts/install.sh

# tmux
../tmux_install.sh

# build vim
../build-vim.sh

# install the vim plugins
vim +PlugInstall +qall

# install ycm plugin(has external dependencies)
../install_ycm.sh

# install diff-so-fancy
(cd ~/work && git clone https://github.com/so-fancy/diff-so-fancy.git)

# install zsh + dependencies
../oh_zsh_install.sh

#forget all the hashed paths
hash -r
