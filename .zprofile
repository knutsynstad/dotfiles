if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  export WLR_NO_HARDWARE_CURSORS=1
  export WLR_RENDERER_ALLOW_SOFTWARE=1
  export LIBVA_DRIVER_NAME=nvidia
  export GBM_BACKEND=nvidia-drm
  export __GLX_VENDOR_LIBRARY_NAME=nvidia
  export __GL_GSYNC_ALLOWED=1
  export __GL_VRR_ALLOWED=1
  export QT_QPA_PLATFORMTHEME=qt6ct
  export QT_STYLE_OVERRIDE=kvantum
  export PATH="$PATH:$HOME/.local/bin"
  export NOBROWSER=1
  export ELECTRON_OZONE_PLATFORM_HINT=auto
  export QT_QPA_PLATFORM=wayland
  export GDK_BACKEND=wayland
  exec Hyprland
fi
