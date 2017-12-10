# install base 16 colorschemes for xfce terminal
curr_dir=$(pwd)
mkdir -p ~/work
cd ~/work
git clone https://github.com/afg984/base16-xfce4-terminal
cd base16-xfce4-terminal/colorschemes
mkdir -p ~/.local/share/xfce4/terminal/colorschemes
cp *.theme ~/.local/share/xfce4/terminal/colorschemes/
cd $curr_dir
