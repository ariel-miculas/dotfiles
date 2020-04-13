curr_dir=$(pwd)
sudo apt-get install build-essential cmake
sudo apt-get install python-dev python3-dev
cd ../vim.symlink/bundle/YouCompleteMe
python3 ./install.py --clang-completer --clangd-completer
cd $curr_dir
