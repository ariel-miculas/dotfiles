# Installing archlinux
## Guides
https://wiki.archlinux.org/title/installation_guide
https://techofide.com/blogs/how-to-install-arch-linux-2021-installation-guide-techofide/
https://www.explorelinux.com/convert-a-disk-gpt-to-mbr-linux/

## ntp
```
timedatectl set-ntp true
```
## Partition the disk with `fdisk`
1. boot partition (200M)
2. root partition (remainder)

## Disk Encryption
https://wiki.archlinux.org/title/Dm-crypt/Encrypting_an_entire_system#LUKS_on_a_partition
### Root partition
```
cryptsetup -y -v luksFormat /dev/nvme0n1p2
cryptsetup open /dev/nvme0n1p2 cryptroot
mkfs.ext4 /dev/mapper/cryptroot
mount /dev/mapper/cryptroot /mnt
```
Sanity check:
```
umount /mnt
cryptsetup close cryptroot
cryptsetup open /dev/nvme0n1p2 cryptroot
mount /dev/mapper/cryptroot /mnt
```

### Boot partition
`/mnt` must be mounted before creating and mounting `/mnt/boot`
```
mkfs.ext4 /dev/nvme0n1p1
mkdir /mnt/boot
mount /dev/nvme0n1p1 /mnt/boot
```


## Essential packages
```
pacstrap /mnt base linux linux-firmware
```

## Fstab
```
genfstab -U /mnt > /mnt/etc/fstab
```

# Chroot steps
```
arch-chroot /mnt
```

```
ln -sf /usr/share/zoneinfo/Europe/Bucharest /etc/localtime
hwclock --systohc
pacman -S vim
```

Edit `/etc/locale.gen` by uncommenting the `en_US.UTF-8` line, then run:
```
locale-gen
```

```
cat <<EOF > /etc/locale.conf
LANG=en_US.UTF-8
LC_ALL=en_US.UTF-8
LC_CTYPE=en_US.UTF-8
EOF
```

```
echo archlinux /etc/hostname
```

```
cat <<EOF > /etc/hosts
127.0.0.1	localhost
::1		localhost
127.0.1.1	archlinux
EOF
```

Modify `/etc/mkinitcpio.conf` to [include](https://wiki.archlinux.org/title/Dm-crypt/Encrypting_an_entire_system#Configuring_mkinitcpio):
```
MODULES=(i915)
HOOKS=(base systemd autodetect keyboard sd-vconsole modconf block sd-encrypt filesystems fsck)
```

```
touch /etc/vconsole.conf
mkinitcpio -P
```

```
passwd
```

## Grub
```
pacman -S grub
grub-install --target=i386-pc /dev/nvme0n1
grub-mkconfig -o /boot/grub/grub.cfg
```
Add the following kernel parameters:
```
rd.luks.name=2b1396e0-b3e0-4c0d-a8cb-1eb4e8d1c2c7=cryptroot
```
where 2b1396e0-b3e0-4c0d-a8cb-1eb4e8d1c2c7 is the UUID of the root partition (`nvme0n1p2` in this case)
```
$ lsblk -f
NAME          FSTYPE      FSVER            LABEL       UUID                                 FSAVAIL FSUSE% MOUNTPOINTS
nvme0n1
├─nvme0n1p1   ext4        1.0                          2df35da2-bc73-4afd-87c8-fdb5640977a8   98.9M    40% /boot
└─nvme0n1p2   crypto_LUKS 2                            2b1396e0-b3e0-4c0d-a8cb-1eb4e8d1c2c7
  └─cryptroot ext4        1.0                          a0b756d9-f619-4639-bd8a-c1f23143baac  424.6G     4% /
```

## Enable networking
```
pacman -S networkmanager
systemctl enable NetworkManager.service
```

## needed for openconnect
```
systemctl enable systemd-resolved.service
```

## bluetooth service
```
pacman -S blueman
systemctl enable bluetooth.service
```

## Update to latest version
```
sudo pacman -Syyu
```

## Create a new user (https://www.vultr.com/docs/create-a-sudo-user-on-arch-linux)
```
pacman -S sudo
useradd --create-home ariel
passwd ariel
usermod --append --groups wheel ariel
visudo # (uncomment `%wheel ALL...`)
```

## Install KDE
```
pacman -S xorg
pacman -S plasma kde-applications
systemctl enable sddm.service
```

# Swapfile
## Creating a 512M swapfile:
```
dd if=/dev/zero of=/swapfile bs=1M count=512 status=progress
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
echo '/swapfile none swap defaults 0 0' >> /etc/fstab
```
## Removing the swapfile:
```
swapoff /swapfile
rm -f /swapfile
```
