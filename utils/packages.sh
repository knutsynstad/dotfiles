#!/bin/bash


#  ██████╗  █████╗  █████╗ ██╗  ██╗ █████╗  ██████╗ ███████╗ ██████╗
#  ██╔══██╗██╔══██╗██╔══██╗██║ ██╔╝██╔══██╗██╔════╝ ██╔════╝██╔════╝
#  ██████╔╝███████║██║  ╚═╝█████═╝ ███████║██║  ██╗ █████╗  ╚█████╗
#  ██╔═══╝ ██╔══██║██║  ██╗██╔═██╗ ██╔══██║██║  ╚██╗██╔══╝   ╚═══██╗
#  ██║     ██║  ██║╚█████╔╝██║ ╚██╗██║  ██║╚██████╔╝███████╗██████╔╝
#  ╚═╝     ╚═╝  ╚═╝ ╚════╝ ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝╚═════╝


# Exit immediately if something fails
set -e

# Prevent running as root
if [ "$EUID" -eq 0 ]; then
  echo "Do NOT run this script as root."
  exit 1
fi

echo "Updating system before installing packages..."
sudo pacman -Syu --noconfirm

echo "Installing packages ..."


# Base / System

sudo pacman -S --noconfirm --needed \
base base-devel \
linux linux-headers linux-lts linux-lts-headers \
linux-firmware linux-firmware-nvidia amd-ucode \
dkms efibootmgr smartmontools zram-generator \
git zsh unzip wget less vim nano htop inetutils fuse2

# Oh My Zsh

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  export RUNZSH=no       # Don't start Zsh after install
  export CHSH=no         # Don't change the shell (yet)
  export KEEP_ZSHRC=yes  # Don't overwrite .zshrc
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "Oh My Zsh already installed. Skipping..."
fi


# Networking

sudo pacman -S --noconfirm --needed \
networkmanager network-manager-applet \
iwd wireless_tools \
nfs-utils


# NVIDIA / Graphics

sudo pacman -S --noconfirm --needed \
nvidia-open-dkms \
lib32-nvidia-utils \
nvidia-settings \
libva-nvidia-driver \
lib32-vulkan-icd-loader \
vulkan-tools


# Wayland / Hyprland

sudo pacman -S --noconfirm --needed \
hyprland hyprpaper \
wl-clipboard grim slurp mako waybar \
rofi wofi \
xdg-desktop-portal-hyprland \
qt5-wayland qt6-wayland qt5ct qt6ct \
polkit-kde-agent kvantum \
xdg-utils


# Audio

sudo pacman -S --noconfirm --needed \
pipewire \
pipewire-alsa \
pipewire-jack \
pipewire-pulse \
wireplumber \
gst-plugin-pipewire \
libpulse \
pavucontrol


# Fonts

sudo pacman -S --noconfirm --needed \
ttf-jetbrains-mono-nerd \
inter-font \
otf-font-awesome


# Desktop apps

sudo pacman -S --noconfirm --needed \
firefox \
discord \
signal-desktop \
obs-studio \
nautilus \
kitty \
gimp \
inkscape \
scribus \
blender \
godot \
kicad \
kicad-library \
kicad-library-3d


# Development

sudo pacman -S --noconfirm --needed \
github-cli \
code \
opencode \
openai-codex


# Gaming

sudo pacman -S --noconfirm --needed \
steam \
lutris \
gamemode \
lib32-gamemode \
gamescope \
wine \
winetricks


# AUR helper

if ! command -v yay &> /dev/null; then
  echo "yay not found, installing..."

  tmpdir="$(mktemp -d)"
  git clone https://aur.archlinux.org/yay.git "$tmpdir/yay"
  cd "$tmpdir/yay"
  makepkg -si --noconfirm
  cd -
  rm -rf "$tmpdir"
fi


# AUR packages

yay -S --noconfirm --needed \
1password \
spotify


# Default shell

if [ "$SHELL" != "/bin/zsh" ]; then
  echo "Setting Zsh as the default shell..."
  chsh -s /bin/zsh
else
  echo "Zsh is already the default shell."
fi


# Success!

echo "Done installing packages!"
