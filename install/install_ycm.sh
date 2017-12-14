curr_dir=$(pwd)
sudo apt-get install build-essential cmake
sudo apt-get install python-dev python3-dev
cd ../vim.symlink/bundle/YouCompleteMe
./install.py --clang-completer
cd $curr_dir
