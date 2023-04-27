#!/bin/bash 

# bashpref
echo ". $(pwd)/bash/bashpref" >> ~/.bashrc

# zshrc
rm -f ~/.zshrc
ln -s $(pwd)/zshrc/.zshrc ~/.zshrc

#scripts
ln -s $(pwd)/scripts ~/.local/scripts

# tmux
rm ~/.tmux.conf
ln -s $(pwd)/tmux/.tmux.conf ~/.tmux.conf

# nvim
rm -rf ~/.config/nvim 
ln -s $(pwd)/nvim ~/.config/nvim

# lvim
rm -rf ~/.config/lvim 
ln -s $(pwd)/lvim ~/.config/lvim

# sway
rm -rf ~/.config/nvim 
ln -s $(pwd)/sway ~/.config/sway

# gsettings 
# dconf load / < file.conf
