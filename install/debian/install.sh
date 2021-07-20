#!/bin/bash
# This script compiles vim from sources and installs other useful programs
set -e

# colorschemes for the terminal
install/get-base16-colorschemes.sh

# fonts for the terminal (used by vim)
fonts/install.sh

# tmux
install/tmux_install.sh

# build vim
install/build-vim.sh

# install the vim plugins
vim +PlugInstall +qall

# install ycm plugin(has external dependencies)
./install/install_ycm.sh


# install diff-so-fancy
(cd ~/work && git clone https://github.com/so-fancy/diff-so-fancy.git)

# install fd_8.1.1
(cd /tmp && wget https://github.com/sharkdp/fd/releases/download/v8.1.1/fd_8.1.1_amd64.deb && sudo dpkg -i fd_8.1.1_amd64.deb)

# install bat_0.16.0
(cd /tmp && wget https://github.com/sharkdp/bat/releases/download/v0.16.0/bat_0.16.0_amd64.deb && sudo dpkg -i bat_0.16.0_amd64.deb)

# install autojump
sudo apt install -y autojump

# install ag
sudo apt install -y silversearcher-ag

# install stow (needed for dotfiles)
sudo apt install -y stow

#forget all the hashed paths
hash -r

# remap capslock key to control in ubuntu
# sudo vi /etc/default/keyboard
# And edit XKBOPTIONS="ctrl:nocaps"
# Then, reconfigure:
# sudo dpkg-reconfigure keyboard-configuration

