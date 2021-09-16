# SH
rm -rf ~/.profile && ln -s ~/.dotfiles/sh/.profile ~/.profile

# BASH
rm -rf ~/.bashrc && ln -s ~/.dotfiles/bash/.bashrc ~/.bashrc
rm -rf ~/.bash_profile && ln -s ~/.dotfiles/bash/.bash_profile ~/.bash_profile
rm -rf ~/.bash_logout && ln -s ~/.dotfiles/bash/.bash_logout ~/.bash_logout
rm -rf ~/.bash_login && ln -s ~/.dotfiles/bash/.bash_login ~/.bash_login

# ZSH
rm -rf ~/.config/zsh && ln -s ~/.dotfiles/zsh ~/.config/zsh
rm -rf ~/.zshenv && ln -s ~/.dotfiles/zsh/.zshenv ~/.zshenv

# Firefox
if [ -d "$HOME/.mozilla" ] ; then
    mv ~/.mozilla ~/.config/mozilla
fi
ln -s ~/.mozilla ~/.config/mozilla

# mv .gnupg/ .local/share/gnupg