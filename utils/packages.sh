#!/bin/bash

#
#  ██╗███╗  ██╗ ██████╗████████╗ █████╗ ██╗     ██╗
#  ██║████╗ ██║██╔════╝╚══██╔══╝██╔══██╗██║     ██║
#  ██║██╔██╗██║╚█████╗    ██║   ███████║██║     ██║
#  ██║██║╚████║ ╚═══██╗   ██║   ██╔══██║██║     ██║
#  ██║██║ ╚███║██████╔╝   ██║   ██║  ██║███████╗███████╗
#  ╚═╝╚═╝  ╚══╝╚═════╝    ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝
#  ██╗████████╗     █████╗ ██╗     ██╗     ██╗
#  ██║╚══██╔══╝    ██╔══██╗██║     ██║     ██║
#  ██║   ██║       ███████║██║     ██║     ██║
#  ██║   ██║       ██╔══██║██║     ██║     ╚═╝
#  ██║   ██║       ██║  ██║███████╗███████╗██╗
#  ╚═╝   ╚═╝       ╚═╝  ╚═╝╚══════╝╚══════╝╚═╝
#

# Exit immediately if something fails
set -e

# Prevent running as root
if [ "$EUID" -eq 0 ]; then
  echo "Please do NOT run this script with sudo. Just run ./install.sh as your user."
  exit 1
fi

echo "Installing packages ..."


#  █▀▀ █▀█ █▀█ █▀▀   █ █ ▀█▀ █ █   █ ▀█▀ █ █▀▀ █▀
#  █▄▄ █▄█ █▀▄ ██▄   █▄█  █  █ █▄▄ █  █  █ ██▄ ▄█

sudo pacman -Syu --noconfirm --needed unzip


#  █▄ █ █▀▀ ▀█▀ █ █ █ █▀█ █▀█ █▄▀ █ █▄ █ █▀▀
#  █ ▀█ ██▄  █  ▀▄▀▄▀ █▄█ █▀▄ █ █ █ █ ▀█ █▄█

sudo pacman -Syu --noconfirm --needed \
networkmanager network-manager-applet iwd wireless_tools


#  █▀▀ █▀█ █ █    ▄▀  █ █ █ █▀▄ █▀▀ █▀█
#  █▄█ █▀▀ █▄█  ▄▀    ▀▄▀ █ █▄▀ ██▄ █▄█

sudo pacman -Syu --noconfirm --needed \
nvidia lib32-nvidia-utils nvidia-settings libva-nvidia-driver \
lib32-vulkan-icd-loader vulkan-tools


#  █ █ █ ▄▀█ █▄█ █   ▄▀█ █▄ █ █▀▄    ▄▀  █ █ █▄█ █▀█ █▀█ █   ▄▀█ █▄ █ █▀▄
#  ▀▄▀▄▀ █▀█  █  █▄▄ █▀█ █ ▀█ █▄▀  ▄▀    █▀█  █  █▀▀ █▀▄ █▄▄ █▀█ █ ▀█ █▄▀

sudo pacman -Syu --noconfirm --needed \
hyprland hyprpaper wl-clipboard grim slurp mako waybar wofi \
xdg-desktop-portal-hyprland qt5-wayland qt6-wayland qt5ct qt6ct \
polkit-kde-agent kvantum xdg-utils xorg-xwayland


#  ▄▀█ █ █ █▀▄ █ █▀█
#  █▀█ █▄█ █▄▀ █ █▄█

sudo pacman -Syu --noconfirm --needed pavucontrol


#  █▀▀ █▀█ █▄ █ ▀█▀ █▀
#  █▀  █▄█ █ ▀█  █  ▄█

sudo pacman -Syu --noconfirm --needed \
ttf-jetbrains-mono-nerd inter-font otf-font-awesome


#  █▀▄ █▀▀ █▀ █▄▀ ▀█▀ █▀█ █▀█   ▄▀█ █▀█ █▀█ █▀
#  █▄▀ ██▄ ▄█ █ █  █  █▄█ █▀▀   █▀█ █▀▀ █▀▀ ▄█

sudo pacman -Syu --noconfirm --needed \
firefox discord obs-studio nautilus kitty gimp inkscape \
scribus steam


#  ▄▀█ █ █ █▀█   █ █ █▀▀ █   █▀█ █▀▀ █▀█
#  █▀█ █▄█ █▀▄   █▀█ ██▄ █▄▄ █▀▀ ██▄ █▀▄

if ! command -v yay &> /dev/null; then
  echo "yay not found, installing..."
  cd /tmp
  git clone https://aur.archlinux.org/yay.git
  cd yay
  makepkg -si --noconfirm
fi


#  ▄▀█ █ █ █▀█   █▀█ ▄▀█ █▀▀ █▄▀ ▄▀█ █▀▀ █▀▀ █▀
#  █▀█ █▄█ █▀▄   █▀▀ █▀█ █▄▄ █ █ █▀█ █▄█ ██▄ ▄█

yay -S --noconfirm --needed \
1password spotify


echo "Done installing packages!"
