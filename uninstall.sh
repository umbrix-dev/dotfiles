#!/usr/bin/env bash

echo "Starting umbrix dotfiles uninstallation process..."
echo ""

# Ensure config directory exists
echo "Ensure ~/.config directory exists."
mkdir -p ~/.config

# List of configs
configs="btop fastfetch hypr kitty rofi waybar"

process_configs() {
    for cfg in $configs; do
        echo "Processing config: $cfg"
        
        echo "--- Remove symlink..."
        [ -L ~/.config/$cfg ] && rm ~/.config/$cfg
        echo ""

        echo "--- Restoring backup..."
        [ -e ~/.config/$cfg.bak ] && mv ~/.config/$cfg.bak ~/.config/$cfg
        echo ""

        echo "--- Removing possible empty directory..."
        rmdir ~/.config/$cfg 2>/dev/null
        echo ""
    done
    echo ""
}

reload_configs () {
    echo ""
    echo "Reloading configs..."

    hyprctl reload
    kill -SIGUSR1 $KITTY_PID
    killall -SIGUSR2 waybar
}

main () {
    process_configs
    reload_configs
}

main