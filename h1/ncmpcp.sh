#!/bin/bash

# Install ncmpcpp and mpd
sudo pacman -S ncmpcpp 

# Check if .config directory exists, if not create it
if [ ! -d "$HOME/.config" ]; then
    mkdir -p "$HOME/.config"
fi

# Copy ncmpcpp configuration to .config directory
cp -r /usr/share/doc/ncmpcpp/config "$HOME/.config/ncmpcpp"
