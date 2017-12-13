# Building vim
# get dependencies
curr_dir=$(pwd)

sudo apt install libncurses5-dev libgnome2-dev libgnomeui-dev \
    libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
    libcairo2-dev libx11-dev libxpm-dev libxt-dev \
    python3-dev libperl-dev git

mkdir -p ~/work
cd ~/work
# clone the vim repo
git clone https://github.com/vim/vim.git
cd vim
./configure --with-features=huge \
            --enable-multibyte \
            --enable-python3interp=yes \
            --with-python3-config-dir=/usr/lib/python3.5/config \
            --enable-perlinterp=yes \
            --enable-gui=gnome2 \
            --enable-cscope \
            --prefix=/usr/local
make VIMRUNTIMEDIR=/usr/local/share/vim/vim80
sudo make install
# make vim the default editor and map vi to vim
sudo update-alternatives --install  /usr/bin/editor editor /usr/local/bin/vim 1
sudo update-alternatives --set      editor /usr/local/bin/vim
sudo update-alternatives --install  /usr/bin/vi vi /usr/local/bin/vim 1
sudo update-alternatives --set      vi /usr/local/bin/vim

cd $curr_dir