curr_dir=$(pwd)
sudo apt-get install python-gtk2 python-setuptools python-distutils-extra
mkdir -p ~/work
cd ~/work
git clone https://github.com/wavexx/screenkey
cd screenkey
sudo ./setup.py install
cd $curr_dir
