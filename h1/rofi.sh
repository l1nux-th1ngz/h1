#!/bin/bash

# Install Rofi
sudo pacman -S rofi

# Check if .config directory exists, if not create it
if [ ! -d "$HOME/.config" ]; then
    mkdir -p "$HOME/.config"
fi

# Copy Rofi configuration files to .config directory
cp -r /usr/share/rofi/config.rasi "$HOME/.config/rofi.rasi"
cp -r /usr/share/rofi/themes "$HOME/.config/"
