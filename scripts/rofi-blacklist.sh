#!/bin/bash

# Rofi Blacklist Script
# Creates .desktop files that hide unwanted apps
# You only need to run this script once

# An entry needs to be the exact name from the .desktop file
# and it is case-sensetive.
BLACKLIST=(
    # === TERMINAL
    "htop"
    "nvim"
    "vim"
    "yazi"

    # === GPU/SYSTEM
    "nvtop"
    "nvidia-settings"

    # === GPS
    "xgpsspeed"
    "xgps"

    # === URL HANDLERS
    "kitty-open"
    "windsurf-url-handler"
    "code-url-handler"
    "openstreetmap-geo-handler"
    "google-maps-geo-handler"
    "wheelmap-geo-handler"

    # === QT/KDE
    "assistant"
    "designer"
    "linguist"
    "qdbusviewer"
    "qv4l2"
    "qvidcap"
    "org.kde.polkit-kde-authentication-agent-1"
    "org.kde.ksecret"
    "org.kde.knewstuff-dialog6"
    "org.kde.kiod6"
    "org.kde.dolphin"
    "kcm_webshortcuts"
    "kcm_trash"
    "kcm_proxy"
    "kcm_netpref"
    "ktelnetservice6"

    # === GTK/GNOME
    "user-dirs-update-gtk"
    "nwg-look"
    "nautilus-autorun-software"

    # === SYSTEM UTILS
    "uuctl"
    "satty"
    "rofi-theme-selector"
    "org.freedesktop.Xwayland"

    # === PINENTRY
    "org.gnupg.pinentry-qt"
    "org.gnupg.pinentry-qt5"

    # === DEV
    "cmake-gui"
    "electron37"

    # === REMOTE
    "bvnc"
    "bssh"

    # === NETWORK
    "avahi-discover"

    # === OTHER
    "cool-retro-term"
    "firefox"
    "com.github.PintaProject.Pinta"
)

mkdir -p ~/.local/share/applications

echo "Blacklisting apps from rofi..."
echo ""

for app in "${BLACKLIST[@]}"; do
    # Skip empty lines and comments
    [[ -z "$app" || "$app" =~ ^# ]] && continue

    # Create .desktop file to hide the app
    cat > ~/.local/share/applications/"$app".desktop << EOF
[Desktop Entry]
Type=Application
Name=$app
NoDisplay=true
EOF
    echo "  Blacklisted: $app"
done

echo ""
echo "Done! ${#BLACKLIST[@]} apps are now blacklisted from rofi."
echo ""
echo "Help:"
echo "  - To unblock an app: rm ~/.local/share/applications/appname.desktop"
echo "  - To see blocked apps: ls ~/.local/share/applications/"
echo ""
echo "Restart rofi or run: rofi -show drun"