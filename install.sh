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

# install ack
cpan install App::Ack

# install ycm plugin(has external dependencies)
./install/install_ycm.sh

# install cppcheck (needed for the syntastic plugin)
sudo apt-get install cppcheck

#forget all the hashed paths
hash -r
