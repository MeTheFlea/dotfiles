# Installation
use a swapfile instead of partition https://wiki.archlinux.org/index.php/Swap#Swap_file
enable microcode updates and use efibootmgr to put it in kernel params

## Partitioning
use fdisk
partition disks so that you have ~550MB FAT32 marked as EFI Partition for /boot (uefi)
rest can be whatever

## Efibootmgr
example entry (needs to target the EFI partition)
efibootmgr --create --disk /dev/sda --part 1 --label "Arch Linux" --loader /vmlinuz-linux --unicode 'root=PARTUUID=xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx rw initrd=\intel-ucode.img initrd=\initramfs-linux.img'
use blkid to find PARTUUID

# Essential Packages
compton
bspwm
dmenu
rxvt-unicode
hack-ttf
polybar
yay (aur helper)
networkmanager
feh
sudo
efibootmgr
xorg-server
xorg-xrandr
xorg-xinit
alsa-utils
gvim

# Packages
fcron
p7zip
rclone
keepassx2

# Pacman
edit /etc/pacman.conf to add colours

# Audio
unmute ALSA
https://wiki.archlinux.org/index.php/Advanced_Linux_Sound_Architecture#Unmuting_the_channels

# fcron
if you want to run something that needs an X-server, add DISPLAY=:0 (correct display) before the script you want to run (e.g. change bg with feh)

# Mounting with rclone
setup a user service to mount whatever on inital login

Use a cache backend, example config:

[dropbox-cache]
type = cache
remote = dropbox:
chunk_total_size = 50G
chunk_size = 10M
writes = true
chunk_clean_interval = 15m0s
tmp_upload_path = /home/martin/.cache/rclone/cache-backend/uploadcache/dropbox

# General
- add yourself to sudo group
- do yay --save --combinedupgrade
	- do repo + aur updates at once and saves it as a permanent setting

# Wifi
use networkmanager
- don't need to enable the daemons for dhcpcd manually

# Touchpad
Setup tap to click
https://wiki.archlinux.org/index.php/Libinput

# Multilib (for 32bit programs)
https://wiki.archlinux.org/index.php/Official_repositories#multilib

To enable multilib repository, uncomment the [multilib] section in /etc/pacman.conf:

/etc/pacman.conf

[multilib]
Include = /etc/pacman.d/mirrorlist

# Firefox
Hide tabs + sidebar text with tree-style tabs
https://github.com/piroor/treestyletab/wiki/Code-snippets-for-custom-style-rules#hide-horizontal-tabs-at-the-top-of-the-window-1349-1672-2147

# Backlight
acpilight (aur) - drop-in replacement for xbacklight
- add yourself to video group
- need to be in video group in order to be able to change brightness

# NVIDIA
https://wiki.archlinux.org/index.php/NVIDIA
use nvidia package, the nvidia-304xx etc packages are legacy - never use them
https://wiki.archlinux.org/index.php/NVIDIA_Optimus
