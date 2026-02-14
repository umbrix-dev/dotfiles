#!/usr/bin/env bash

echo "Starting umbrix dotfiles installation process..."
echo ""

# Ensure config directory exists
echo "Ensure ~/.config directory exists."
mkdir -p ~/.config

# List of configs
configs="btop fastfetch hypr kitty rofi waybar"

process_configs () {
    for cfg in $configs; do
        echo "Processing config: $cfg"
        
        echo "--- Creating backup..."
        mv ~/.config/$cfg ~/.config/$cfg.bak
        echo ""
        
        echo "--- Ensuring it exists as config..."
        mkdir -p ~/.config/$cfg
        echo ""

        echo "--- Creating symlink..."
        ln -s $(pwd)/$cfg ~/.config/$cfg
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