#!/usr/bin/env bash

packages=(
  waybar
  rofi
  kitty
  code
  fastfetch
  btop
  swww
  zen-browser
  obsidian
  nautilus
  hyprsnap
)

# Replace this with the package manager you have
# if you dont have pacman
install_cmd="sudo pacman -S --needed"

echo "Dotfiles package installer"
echo

for pkg in "${packages[@]}"; do
  read -rp "Install $pkg? (y/n) " choice
  case "$choice" in
    y|Y)
      $install_cmd "$pkg"
      ;;
    *)
      echo "Skipping $pkg"
      ;;
  esac
  echo
done

echo "Done."
