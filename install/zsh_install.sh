#!/bin/bash
sudo apt install zsh
# Make zsh the default shell
chsh -s $(which zsh)
# Install oh-my-zsh
wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - | sh
# Install syntax highlighting for currently typed commands
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
