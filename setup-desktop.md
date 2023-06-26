# Begin - Todo ansible  
`sudo apt update && sudo apt -y upgrade`
# apt
` sudo apt install \
    dconf-editor gnome-tweaks \
    mpv vlc gimp \
    fzf zsh tmux \
    python-is-python3
`
# Install font
unzip rice/FiraCode.zip
and move to `/usr/local/fonts` then
`fc-cache -fv` 

# zsh things
install oh-my-zsh, zsh-autosugesstions

# Install Neovim
download latest appimage
extract and put squashfs at / 
add it's bin to PATH 

# setup gnome extentions

gnome extensions from firefox/chrome
user themes, gsconnect, spacebar, time++, clipboard indicator, net speed simplified, 
color picker, caffeine

# Set dotfiles from setdots.sh 

# Install Packer
    :so packer & PackeSync

# dconf 
`dconf load / < rice/any.conf`

# gnome-terminal padding 

# Install Rust , NVM - node

# Apps 
`foliate, cozy, elsa, g4music from ppa or flatpak`

# Docker  

# Wayland

# Waydroid 

# GSConnect pairing  

# VSCode or VSCodium 

# Boxes 

# VirtualBox

# Setup Backup drive - edit fstab to automount at boot

# Zathura as default pdf reader
`for type in pdf x-pdf fdf xdp xfdf pdx; do xdg-mime default org.pwmt.zathura.desktop application/$type; done`


