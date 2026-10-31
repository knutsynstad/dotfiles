#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MANIFEST="$SCRIPT_DIR/apps.conf"

APP_DIR="$HOME/.local/opt/appimages"
ICON_DIR="$HOME/.local/share/icons/appimages"
DESKTOP_DIR="$HOME/.local/share/applications"

mkdir -p "$APP_DIR" "$ICON_DIR" "$DESKTOP_DIR"

for command in curl jq; do
  if ! command -v "$command" >/dev/null 2>&1; then
    echo "Missing dependency: $command" >&2
    exit 1
  fi
done

if [[ ! -f "$MANIFEST" ]]; then
  echo "Missing manifest: $MANIFEST" >&2
  exit 1
fi

install_app() {
  local name="$1"
  local repo="$2"
  local pattern="$3"

  local api url target temp extract_dir
  local icon_source icon_path extension
  local display_name desktop_file

  echo "Installing $name..."

  api="https://api.github.com/repos/$repo/releases/latest"

  if ! release=$(curl -fsSL "$api"); then
    echo "Failed to fetch release for $name" >&2
    return 1
  fi

  url=$(jq -r --arg pattern "$pattern" '
    [.assets[].browser_download_url |
     select(endswith($pattern))] | first // empty
  ' <<< "$release")

  if [[ -z "$url" ]]; then
    echo "No matching AppImage for $name" >&2
    return 1
  fi

  target="$APP_DIR/$name.AppImage"
  temp=$(mktemp "$APP_DIR/.${name}.XXXXXX")

  if ! curl -fL --retry 3 "$url" -o "$temp"; then
    rm -f "$temp"
    echo "Download failed for $name" >&2
    return 1
  fi

  chmod +x "$temp"
  mv -f "$temp" "$target"

  # Extract the icon bundled inside the AppImage.
  extract_dir=$(mktemp -d)
  icon_path=""

  if (
    cd "$extract_dir"
    "$target" --appimage-extract >/dev/null 2>&1
  ); then
    local root="$extract_dir/squashfs-root"

    # Prefer the root icon defined by the AppImage.
    icon_source=""

    if [[ -e "$root/.DirIcon" ]]; then
      icon_source="$root/.DirIcon"
    else
      # Fall back to the application icon directory.
      icon_source=$(find "$root" -type f \
        \( -iname '*.png' -o -iname '*.svg' \) \
        -path '*/icons/*' -print -quit)
    fi

    if [[ -n "$icon_source" && -f "$icon_source" ]]; then
      # Follow symlinks and detect the real file extension.
      resolved=$(readlink -f "$icon_source")

      case "${resolved,,}" in
        *.png) extension="png" ;;
        *.svg) extension="svg" ;;
        *.xpm) extension="xpm" ;;
        *) extension="" ;;
      esac

      if [[ -n "$extension" ]]; then
        icon_path="$ICON_DIR/$name.$extension"
        cp -L "$icon_source" "$icon_path"
        echo "  Icon extracted"
      fi
    fi
  fi

  rm -rf "$extract_dir"

  # Capitalize application name for Rofi.
  # photocraft -> PhotoCraft
  display_name="${name^}"
  display_name="${display_name%craft}Craft"

  desktop_file="$DESKTOP_DIR/$name.desktop"

  # Generate desktop launcher.
  cat > "$desktop_file" <<EOF
[Desktop Entry]
Type=Application
Name=$display_name
Comment=$display_name
Exec=$target
Icon=${icon_path:-application-x-executable}
Terminal=false
Categories=Graphics;
StartupNotify=true
EOF

  echo "  Launcher created"
  echo "  Installed $display_name"
  echo
}

failures=0

while IFS='|' read -r name repo pattern || [[ -n "$name" ]]; do
  [[ -z "$name" || "$name" == \#* ]] && continue

  if ! install_app "$name" "$repo" "$pattern"; then
    ((failures += 1))
  fi
done < "$MANIFEST"

echo "Installation complete ($failures failures)."

if (( failures > 0 )); then
  exit 1
fi
