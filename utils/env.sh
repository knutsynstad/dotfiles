#!/bin/bash


#  ███████╗███╗  ██╗██╗   ██╗
#  ██╔════╝████╗ ██║██║   ██║
#  █████╗  ██╔██╗██║╚██╗ ██╔╝
#  ██╔══╝  ██║╚████║ ╚████╔╝
#  ███████╗██║ ╚███║  ╚██╔╝
#  ╚══════╝╚═╝  ╚══╝   ╚═╝


#  █▀▀ █▀▀ █▄ █ █▀▀ █▀█ ▄▀█ █
#  █▄█ ██▄ █ ▀█ ██▄ █▀▄ █▀█ █▄▄

# Ensure local bin is added to PATH only once
if [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
  export PATH="$HOME/.local/bin:$PATH"
fi

# Prevent CLI tools (like git, cargo, etc.) from launching a browser.
export NOBROWSER=1


#  █ █ █ ▄▀█ █▄█ █   ▄▀█ █▄ █ █▀▄    ▄▀  █ █ █▄█ █▀█ █▀█ █   ▄▀█ █▄ █ █▀▄
#  ▀▄▀▄▀ █▀█  █  █▄▄ █▀█ █ ▀█ █▄▀  ▄▀    █▀█  █  █▀▀ █▀▄ █▄▄ █▀█ █ ▀█ █▄▀

# Disables hardware cursors, useful with some NVIDIA GPUs where hardware cursor rendering is buggy.
export WLR_NO_HARDWARE_CURSORS=1

# Allows software rendering as a fallback for WLR (wlroots-based compositors like Hyprland).
export WLR_RENDERER_ALLOW_SOFTWARE=1


#  █▄ █ █ █ █ █▀▄ █ ▄▀█   █▀▀ █▀█ █ █
#  █ ▀█ ▀▄▀ █ █▄▀ █ █▀█   █▄█ █▀▀ █▄█

# NVIDIA-specific environment variables
if lspci | grep -i 'nvidia' >/dev/null; then
  # Ensures VA-API uses the NVIDIA backend for hardware-accelerated video decoding.
  export LIBVA_DRIVER_NAME=nvidia

  # Sets the GBM (Generic Buffer Management) backend. Required for NVIDIA's GBM support on Wayland.
  export GBM_BACKEND=nvidia-drm

  # Ensures NVIDIA's GLX implementation is used.
  export __GLX_VENDOR_LIBRARY_NAME=nvidia

  # Enables G-Sync / Variable Refresh Rate support for NVIDIA GPUs.
  export __GL_GSYNC_ALLOWED=1
  export __GL_VRR_ALLOWED=1
fi

#  █▀▀ █ █ █   █▀▀ █▀█ █▄ █ █▀▀ █ █▀▀
#  █▄█ █▄█ █   █▄▄ █▄█ █ ▀█ █▀  █ █▄█

# Tells Qt apps to use qt6ct to apply themes/settings (especially useful under Wayland).
export QT_QPA_PLATFORMTHEME=qt6ct

# Applies Kvantum theme engine override for Qt apps.
export QT_STYLE_OVERRIDE=kvantum

# Forces Qt apps to use Wayland backend instead of XWayland.
export QT_QPA_PLATFORM=wayland

# Tells GTK apps to use Wayland instead of falling back to X11.
export GDK_BACKEND=wayland

# Suggests Electron apps (like Discord, VS Code) use Wayland if available.
export ELECTRON_OZONE_PLATFORM_HINT=auto
