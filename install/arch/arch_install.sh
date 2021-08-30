## Install keyring
pacman -S archlinux-keyring

# Dotfiles support
sudo pacman --noconfirm -S stow
sudo pacman --noconfirm -S fd
sudo pacman --noconfirm -S bat
sudo pacman --noconfirm -S the_silver_searcher
sudo pacman --noconfirm -S zsh
sudo pacman --noconfirm -S tmux
sudo pacman --noconfirm -S cmake
sudo pacman --noconfirm -S python3

## Install yay
sudo pacman --noconfirm -S --needed base-devel git
mkdir -p ~/work
pushd ~/work
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
popd

## Install autojump
yay -S autojump

# Install development packages
yay -S google-chrome
sudo pacman --noconfirm -S ntfs-3g
sudo pacman --noconfirm -S linux-headers
sudo pacman --noconfirm -S virtualbox virtualbox-guest-iso
sudo pacman --noconfirm -S ncurses
sudo pacman --noconfirm -S gtk2
sudo pacman --noconfirm -S atk
sudo pacman --noconfirm -S cairo
sudo pacman --noconfirm -S libx11
sudo pacman --noconfirm -S libxpm
sudo pacman --noconfirm -S libxt
sudo pacman --noconfirm -S libxtst
sudo pacman --noconfirm -S libsm
sudo pacman --noconfirm -S wget
sudo pacman --noconfirm -S qemu
sudo pacman --noconfirm -S gmp
sudo pacman --noconfirm -S mpfr
sudo pacman --noconfirm -S libmpc
sudo pacman --noconfirm -S grpc
sudo pacman --noconfirm -S fmt
sudo pacman --noconfirm -S spdlog
sudo pacman --noconfirm -S jsoncpp
sudo pacman --noconfirm -S nasm
sudo pacman --noconfirm -S libisoburn
sudo pacman --noconfirm -S mtools
sudo pacman --noconfirm -S meld
sudo pacman --noconfirm -S meson
sudo pacman --noconfirm -S cscope
sudo pacman --noconfirm -S man-pages
sudo pacman --noconfirm -S jdk11-openjdk
sudo pacman --noconfirm -S zip
sudo pacman --noconfirm -S unzip
sudo pacman --noconfirm -S pulseaudio-bluetooth
sudo pacman --noconfirm -S wireshark-qt
sudo pacman --noconfirm -S texlive-most
sudo pacman --noconfirm -S docker
sudo pacman --noconfirm -S rsync

# for kernel compilation
sudo pacman --noconfirm -S xmlto kmod inetutils bc libelf cpio
sudo pacman --noconfirm -S debootstrap

sudo pacman --noconfirm -S tcpdump
sudo pacman --noconfirm -S tidy
sudo pacman --noconfirm -S pandoc
sudo pacman --noconfirm -S firefox
sudo pacman --noconfirm -S clang

# RPM
sudo pacman --noconfirm -S rpmtools

# Trace tools
sudo pacman --noconfirm -S strace
sudo pacman --noconfirm -S ltrace

# vulkan
sudo pacman --noconfirm -S lib32-mesa vulkan-intel lib32-vulkan-intel vulkan-icd-loader lib32-vulkan-icd-loader

# ranger
sudo pacman --noconfirm -S ranger

# Utils
sudo pacman --noconfirm -S cpuid
sudo pacman --noconfirm -S dmidecode
sudo pacman --noconfirm -S hexdump
sudo pacman --noconfirm -S net-tools
