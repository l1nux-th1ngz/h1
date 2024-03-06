#!/bin/bash

# Install reflector package
sudo pacman -S reflector

# Enable reflector timer
sudo systemctl enable reflector.timer
sleep 3

# Start reflector timer
sudo systemctl start reflector.timer
sleep 3

# Start reflector service
sudo systemctl start reflector.service
