#!/bin/bash
#
# This file can contain commands that will be executed at the end of
# EndeavourOS install (online mode only) on the target system.
# The commands will be executed as root.
#
# This allows you to customize the installed system in several ways!
#
# If you add commands to this file, start the install process after
# saving this file.
#
# Tip: save your customized commands into a file on an internet server
# and fetch that file with command:
#
#     wget -O ~/user_commands.bash "URL-referring-the-file"
#
# Ideas for customization:
#   - install packages
#   - remove packages
#   - enable or disable system services
#   - writing dotfiles under $HOME
#   - etc.
#
# Example commands:
#
#     pacman -S --noconfirm --needed gufw geany chromium
#     pacman -Rsn --noconfirm xed
#     systemctl enable ufw
#
# There are some limitations to the commands:
#   - The 'pacman' commands mentioned above require option '--noconfirm',
#     otherwise the install process may hang because pacman waits for a
#     confirmation!
#   - Installing packages with 'yay' does not work because yay may not
#     be run as root.
#     The 'makepkg' command suffers from the same limitation.
#     This essentially blocks installing AUR packages here.
#
# Advanced tip (for ISOs since year 2022):
#    To write files directly into $HOME, you can find the new username
#    as the first parameter given to user_commands.bash, e.g.
#        username="$1"
#    Then you may write files under folder
#        /home/$username
#
# For ISOs released before year 2022:
#    Find your new username with command
#        username=$(cat /tmp/new_username.txt)
#
# New installer feature at 2023-Feb-02:
#    To help customizing calamares on the ISO, user_commands.bash will be called
#    (as root) with 2 parameters:
#        --iso-config
#        "install_mode"     (one of: online, offline, community)
#    before starting the calamares installer.
#    For example:
#        bash ~/user_commands.bash --iso-config online
#
#----------------------------------------------------------------------------------
# Full example (to try it, remove the first '#' from the lines below):
#
#!/bin/bash
#
# # Note: needs ISO since year 2022
 username="$1"
echo "# Hello world!" >> /home/$username/.bashrc
pacman -S --noconfirm --needed chromium libreoffice-fresh \
gdb ninja gcc cmake meson libxcb xcb-proto xcb-util xcb-util-keysyms libxfixes libx11 libxcomposite xorg-xinput libxrender \
pixman wayland-protocols cairo pango seatd libxkbcommon xcb-util-wm xorg-xwayland libinput libliftoff libdisplay-info cpio tomlplusplus \
a52dec faac faad2 flac jasper lame libdca libdv libmad libmpeg2 libtheora libvorbis libxv wavpack x264 xvidcore gstreamer0.10-plugins \
xdg-desktop-portal-hyprland xdg-desktop-portal-gtk qt6-wayland qt5-wayland pipeire wireplumber polkit-kde-agent gtk3 gtk4 gjs nodejs \
go pyhon npm jq wl-clipboard wf-recorder ffmpeg layer-shell-qt gtk-layer-shell mpd mpc mpv vlc cliphist foot ufw guwf grim kanshi libva \
libdecor sddm wlsunset hyprland wofi xdg-user-dirs xdg-user-dirs-gtk slurp ufw-extras kvantum notepadqq bluefish font-manager fontconfig \
noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra cantarell-fonts awesome-terminal-fonts adobe-source-sans-fonts adobe-source-code-pro-fonts \
adwaita-icon-theme breeze-icons nodejs-material-design-icons oxygen-icons oxygen-icons-svg lsd adapta-gtk-theme arc-gtk-theme arc-solid-gtk-theme \
breeze-gtk spotify-launcher playerctl brightnessctl noise-suppression-for-voice viewnior zip unzip p7zip zathura htop btop udisks2 udiskie gvfs \
aalib lz4 ascii gum figlet gum zenity compiler-rt curl git wget plymouth sudo archiso archinstall arch-install-scripts fuse-zip exfat-utils fuse-common \
ranger bluez bluez-utils bluez-tools blueman network-manager-applet networkmanager nm-connection-editor jp2a automake autoconf base base-devel nultilib-devel \
autoconf-archive firefox bzip3 bzip2 zlib lzip dart dart-sass jdk-openjdk jre-openjdk nano python-pipenv python-pip python-pipx python-rich python-pyperclip python-pyaml \
tumbler ffmpegthumbnailer jo gnome-disk-utility gparted vala python-click terminator tilix polkit-gnome pamixer kitty mk-configure piper pkgconf qconf qt5conf qt6conf \
intel-ucode reflector mk-configure dosfstools syslinux exfat-utils exfatprogs fatsort nemo-emblems nemo-fileroller nemo-image-converter nemo-audio-tab gifsicle vhs i2pd \
clibgrab fdupes lynx mjpegtools xdg-utils acpi obsidian ls++ vivid neofetch steam squashfs-tools git-grab kitty-shell-integration marker stow tor
# This runs the following command before Calamares using the paramaters listed above
# Only works with post 2023-Feb-02 ISO.
cal_path=/etc/calamares/modules
log_path=/home/liveuser

if [[ $1 == --iso-config ]]; then 
    echo "$(date): Stage 1. of the user_commands.bash script in-progress..." >> $log_path/log.txt
    if [[ ! $(grep '@snapshots' "$cal_path/mount.conf") ]]; then
            echo "$(date): @snapshots not found.  Modifying mount.conf..." >> $log_path/log.txt
            sudo sed -i '/subvolume: \/@log/a\\    - mountPoint: \/.snapshots\n\      subvolume: \/@snapshots' $cal_path/mount.conf 
            echo "Resulting subvolumes after modification:"            
            grep 'subvolume:' $cal_path/mount.conf | while read line
            do
                echo $line >> $log_path/log.txt
                if [[ $line == *"snapshots"* ]]; then sucess=true; fi
            done
            if [[ sucess != true ]]; then (echo "No @snapshots volume found after edit.  Please manually check mount.conf" >> $log_path/log.txt) && exit 1; fi
    fi
fi 


