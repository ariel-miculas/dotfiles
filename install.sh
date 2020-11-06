# This script installs the dotfiles, compiles vim from sources and installs other
# useful programs

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

# install rupa/z
(cd ~/work && git clone https://github.com/rupa/z)

(cd ~/work && git clone git@github.com:so-fancy/diff-so-fancy.git)

# install fd_8.1.1
(cd /tmp && wget https://github.com/sharkdp/fd/releases/download/v8.1.1/fd_8.1.1_amd64.deb && sudo dpkg -i fd_8.1.1_amd64.deb)

# install bat
sudo apt install bat

# install ag
sudo apt install silversearcher-ag

# install bat
sudo apt install bacula-console-qt

# install cppcheck (needed for the syntastic plugin)
sudo apt-get install cppcheck

# install stow (needed for dotfiles)
sudo apt install stow

#forget all the hashed paths
hash -r

# remap capslock key to control in ubuntu
# sudo vi /etc/default/keyboard
# And edit XKBOPTIONS="ctrl:nocaps"
# Then, reconfigure:
# sudo dpkg-reconfigure keyboard-configuration

