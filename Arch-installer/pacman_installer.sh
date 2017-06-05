#!/bin/bash


#Install required packages
pacman -S zsh vim grub efivar efibootmgr openssh sshfs cryptsetup lvm2 git reflector firewalld networkmanager network-manager-applet networkmanager-openconnect networkmanager-openvpn networkmanager-pptp networkmanager-vpnc firefox rhythmbox chromium vlc ffmpeg exfat-utils fuse-exfat a52dec faac faad2 flac jasper lame libdca libmad libmpeg2 libtheora libvorbis libxv wavpack x264 x265 xvidcore libdvdcss libdvdread libdvdnav dvd+rw-tools dvdauthor dvgrab p7zip unrar tar rsync cmus libreoffice-fresh alsa-utils xorg-server xorg-xinit mesa ttf-dejavu samba smbclient gvfs gvfs-smb xf86-video-intel xf86-input-synaptics screenfetch termite mc glances dmenu youtube-dl gnome-keyring atom htop transmission-gtk transmission-cli pulseaudio feh arandr pacman-mirrorlist unzip zip thunderbird phonon-qt5-vlc phonon-qt5-vlc phonon-qt4-gstreamer phonon-qt4-vlc phonon-qt5-vlc phonon-qt4-gstreamer phonon-qt4-vlc phonon-qt4 phonon-qt5 phonon-qt5-gstreamer okular archlinux-wallpaper geary st tmux epiphany midori baobab weechat ncmpcpp lm_sensors mpc hddtemp nitrogen mpd ncmpcpp conky scrot mpd xfce4-power-manager pcmanfm thunar xfce4-notifyd nmap acpi net-tools wireless_tools iw sysstat gparted dosfstools ntfs-3g nilfs-utils gpart mtools f2fs-tools btrfs-progs lxappearance compton gnome-font-viewer cmake mono cargo autoconf gcc w3m gst-plugins-base gst-plugins-good gst-plugins-bad gst-plugins-ugly gst-libav ffmpegthumbnailer yakuake virt-manager virt-install libvirt srm emacs
#If DE not defined install i3wm
echo "No DE selected, installing i3wm"
if test "$1" = "0" -o "$#" = "0"; then
    pacman -S i3

#Install KDE if plasma defined
elif test "$1" = "plasma"; then
    echo "Installing KDEPlasma DE"
    pacman -S plasma kde-applications

#Install Gnome if gnome defined
elif test "$1" = "gnome"; then
    echo "Installing Gnome DE"
    pacman -S gnome gnome-extra
fi
