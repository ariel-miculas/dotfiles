# From chroot to enable networking
pacman -S networkmanager
sudo systemctl enable NetworkManager.service

# needed for openconnect
sudo systemctl enable systemd-resolved.service

# bluetooth service
sudo systemctl enable bluetooth.service

pacman -S vi vim

# Update to latest version
sudo pacman -Syyu

# Create a new user (https://www.vultr.com/docs/create-a-sudo-user-on-arch-linux)
pacman -S sudo
useradd --create-home ariel
passwd ariel
usermod --append --groups wheel ariel
visudo # (uncomment wheel ALL)

# Install KDE
sudo pacman -S xorg
sudo pacman -S plasma kde-applications
sudo systemctl enable sddm.service

# Install development packages
sudo pacman -S google-chrome
sudo pacman -S --needed base-devel git
sudo pacman -S ntfs-3g
sudo pacman -S linux-headers
sudo pacman -S virtualbox virtualbox-guest-iso
sudo pacman -S stow
sudo pacman -S cmake
sudo pacman -S ncurses
sudo pacman -S gtk2
sudo pacman -S atk
sudo pacman -S cairo
sudo pacman -S libx11
sudo pacman -S libxpm
sudo pacman -S libxt
sudo pacman -S libxtst
sudo pacman -S libsm
sudo pacman -S python3
sudo pacman -S wget
sudo pacman -S fd
sudo pacman -S bat
sudo pacman -S autojump
sudo pacman -S the_silver_searcher
sudo pacman -S zsh
sudo pacman -S tmux
sudo pacman -S qemu
sudo pacman -S gmp
sudo pacman -S mpfr
sudo pacman -S libmpc
sudo pacman -S grpc
sudo pacman -S fmt
sudo pacman -S spdlog
sudo pacman -S jsoncpp
sudo pacman -S nasm
sudo pacman -S libisoburn
sudo pacman -S mtools
sudo pacman -S meld
sudo pacman -S meson
sudo pacman -S cscope
sudo pacman -S man-pages
sudo pacman -S jdk11-openjdk
sudo pacman -S zip
sudo pacman -S unzip
sudo pacman -S pulseaudio-bluetooth
sudo pacman -S wireshark-qt
sudo pacman -S texlive-most
sudo pacman -S docker
sudo pacman -S rsync

# for kernel compilation
sudo pacman -S xmlto kmod inetutils bc libelf cpio
sudo pacman -S debootstrap

sudo pacman -S tcpdump
sudo pacman -S tidy
sudo pacman -S pandoc
sudo pacman -S firefox
sudo pacman -S clang

# RPM
sudo pacman -S rpmtools

# Trace tools
sudo pacman -S strace
sudo pacman -S ltrace

# wine
sudo pacman -S wine
# vulkan
sudo pacman -S lib32-mesa vulkan-intel lib32-vulkan-intel vulkan-icd-loader lib32-vulkan-icd-loader

# ranger
sudo pacman -S ranger

# Utils
sudo pacman -S cpuid
sudo pacman -S dmidecode
sudo pacman -S hexdump
sudo pacman -S net-tools
