#!/bin/bash


#  ███████╗███╗  ██╗██╗   ██╗
#  ██╔════╝████╗ ██║██║   ██║
#  █████╗  ██╔██╗██║╚██╗ ██╔╝
#  ██╔══╝  ██║╚████║ ╚████╔╝
#  ███████╗██║ ╚███║  ╚██╔╝
#  ╚══════╝╚═╝  ╚══╝   ╚═╝


#  █▀▀ █▀▀ █▄ █ █▀▀ █▀█ ▄▀█ █
#  █▄█ ██▄ █ ▀█ ██▄ █▀▄ █▀█ █▄▄

# Ensure local bin is added to PATH only once.
if [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
  export PATH="$HOME/.local/bin:$PATH"
fi

# Prevent CLI tools from automatically opening a browser.
export NOBROWSER=1


#  █▄ █ █ █ █ █▀▄ █ ▄▀█   █▀▀ █▀█ █ █
#  █ ▀█ ▀▄▀ █ █▄▀ █ █▀█   █▄█ █▀▀ █▄█

# NVIDIA-specific environment variables.
if command -v lspci >/dev/null && lspci | grep -qi nvidia; then
  # Use NVIDIA's VA-API backend for hardware video decoding.
  export LIBVA_DRIVER_NAME=nvidia

  # Ensure NVIDIA's OpenGL implementation is selected.
  export __GLX_VENDOR_LIBRARY_NAME=nvidia

  # Allow NVIDIA VRR / G-Sync where supported.
  export __GL_GSYNC_ALLOWED=1
  export __GL_VRR_ALLOWED=1
fi


#  █▀▀ █ █ █   █▀▀ █▀█ █▄ █ █▀▀ █ █▀▀
#  █▄█ █▄█ █   █▄▄ █▄█ █ ▀█ █▀  █ █▄█

# Use qt6ct for Qt appearance configuration.
export QT_QPA_PLATFORMTHEME=qt6ct

# Prefer Wayland for Electron applications while still allowing fallback.
export ELECTRON_OZONE_PLATFORM_HINT=auto
