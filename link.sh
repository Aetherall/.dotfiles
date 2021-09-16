# SH
rm -rf ~/.profile || true
ln -s ~/.dotfiles/sh/.profile ~/.profile

# BASH
rm -rf ~/.bashrc || true
ln -s ~/.dotfiles/bash/.bashrc ~/.bashrc

rm -rf ~/.bash_profile || true
ln -s ~/.dotfiles/bash/.bash_profile ~/.bash_profile

rm -rf ~/.bash_logout || true
ln -s ~/.dotfiles/bash/.bash_logout ~/.bash_logout

rm -rf ~/.bash_login || true
ln -s ~/.dotfiles/bash/.bash_login ~/.bash_login

# ZSH
rm -rf ~/.config/zsh || true
ln -s ~/.dotfiles/zsh ~/.config/zsh

rm -rf ~/.zshenv || true
ln -s ~/.dotfiles/zsh/.zshenv ~/.zshenv

# VIM
rm -rf ~/.config/vim || true
ln -s ~/.dotfiles/vim ~/.config/vim

# Alacritty
rm -rf ~/.config/alacritty || true
ln -s ~/.dotfiles/alacritty ~/.config/alacritty

# Firefox
if [ -d "$HOME/.mozilla" ] ; then
    mv ~/.mozilla ~/.config/mozilla
    ln -s ~/.config/mozilla ~/.mozilla
fi

# mv .gnupg/ .local/share/gnupg