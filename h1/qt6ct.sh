#!/bin/bash

# Install Qt6ct
sudo pacman -S qt6ct

# Check if .config directory exists, if not create it
if [ ! -d "$HOME/.config" ]; then
    mkdir -p "$HOME/.config"
fi

# Copy Qt6ct configuration to .config directory
cp -r /etc/xdg/qt6ct "$HOME/.config/"
