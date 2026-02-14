#!/usr/bin/env bash

# simple script to apply my background
swww img $(pwd)/background.png#!/usr/bin/env bash

echo "Starting umbrix dotfiles uninstallation process..."
echo ""

# Ensure config directory exists
echo "Ensure ~/.config directory exists."
mkdir -p ~/.config

# List of configs
configs="btop fastfetch hypr kitty rofi waybar"

process_configs () {
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

process_shell () {
    echo "Handling zsh files..."

    echo "--- Remove symlinks..."
    [ -L ~/.zshrc ] && rm ~/.zshrc
    [ -L ~/.p10k.zsh ] && rm ~/.p10k.zsh
    echo ""

    echo "--- Restoring backups..."
    [ -e ~/.zshrc.bak ] && mv ~/.zshrc.bak ~/.zshrc
    [ -e ~/.p10k.zsh  ] && mv ~/.p10k.zsh.bak ~/.p10k.zsh
    echo ""

    echo "--- Removing possible empty files..."
    [ ! -s ~/.zshrc ] && rm ~/.zshrc
    [ ! -s ~/.p10k.zsh ] && rm ~/.p10k.zsh
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
    process_shell
    reload_configs
}

main