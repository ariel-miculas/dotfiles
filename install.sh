# This script installs the dotfiles, compiles vim from sources and installs other
# usefull programs

# colorschemes for the terminal
install/get-base16-colorschemes.sh

# fonts for the terminal (used by vim)
fonts/install.sh

# remove .rc files from home so they can be overwritten by the dotfiles script
rm ~/.bashrc
rm ~/.profile

# Install the dotfiles
install/install.py

# useful programs
install/tmux_install.sh

# build vim
install/build-vim.sh

# install Vundle
[ -d ~/.vim/bundle/Vundle.vim ] || git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# install the vim plugins
vim +PluginInstall +qall

# install ycm plugin(has external dependencies)
./install/install_ycm.sh

# install ag
sudo apt install silversearcher-ag

# install cppcheck (needed for the syntastic plugin)
sudo apt-get install cppcheck

#forget all the hashed paths
hash -r
