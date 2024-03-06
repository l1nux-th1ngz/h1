#!/bin/bash

# Install intel-ucode package
sudo pacman -S intel-ucode

# Update Grub configuration
sudo grub-mkconfig -o /boot/grub/grub.cfg
