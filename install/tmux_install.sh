#!/bin/bash
set -e
sudo apt install -y tmux
sudo apt install -y xclip
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
