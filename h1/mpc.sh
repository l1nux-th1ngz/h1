#!/bin/bash

# Install mpc
sudo pacman -S mpc

# Check if .config directory exists, if not create it
if [ ! -d "$HOME/.config" ]; then
    mkdir -p "$HOME/.config"
fi

# Copy mpc configuration to .config directory
cp -r "$HOME/.mpdconf" "$HOME/.config/mpdconf"
