#!/bin/bash

# Install Qt5ct
sudo pacman -S qt5ct

# Check if .config directory exists, if not create it
if [ ! -d "$HOME/.config" ]; then
    mkdir -p "$HOME/.config"
fi

# Copy Qt5ct configuration to .config directory
cp -r /etc/xdg/qt5ct "$HOME/.config/"
