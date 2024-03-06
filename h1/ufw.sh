#!/bin/bash

# Install required packages
sudo pacman -S ufw ufw-extras gufw

# Enable UFW firewall
sudo ufw enable
sleep 3

# Enable UFW service to start on boot
sudo systemctl enable ufw.service
sleep 3
