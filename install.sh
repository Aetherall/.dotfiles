sudo apt update -y
sudo apt upgrade -y
sudo apt dist-upgrade -y
sudo apt autoremove -y
sudo ubuntu-drivers autoinstall
sudo apt install vim -y
sudo apt install git -y
sudo apt install curl -y
sudo snap install --classic code

rm -rf ~/Templates
rm -rf ~/Pictures
rm -rf ~/Videos
rm -rf ~/Desktop

sudo apt install zsh -y

echo "changing default shell to zsh, please authorize"
chsh -s /bin/zsh

echo "installing starship theme"
sh -c "$(curl -fsSL https://starship.rs/install.sh)" -- -y

echo "Installing rust"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

