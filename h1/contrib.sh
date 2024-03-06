#!/bin/bash

# Install pacman-contrib package
sudo pacman -S pacman-contrib

# Enable paccache timer
sudo systemctl enable paccache.timer
