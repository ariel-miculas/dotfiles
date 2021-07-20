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

