#!/bin/bash
sudo apt install zsh

# Make zsh the default shell
chsh -s $(which zsh)

# Install oh-my-zsh and required dependencies
../oh_zsh_install.sh
