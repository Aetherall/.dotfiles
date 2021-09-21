sudo apt update -y
sudo apt upgrade -y
sudo apt dist-upgrade -y
sudo apt autoremove -y
sudo ubuntu-drivers autoinstall
sudo apt install vim -y
sudo apt install git -y
sudo apt install curl -y
sudo apt install htop -y
sudo apt install tmate -y

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

echo "Installing alacritty"
sudo apt install -y cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3 libegl1-mesa-dev gzip
cargo install alacritty

echo "Installing desktop alacritty"
mkdir ~/.sources
git clone https://github.com/alacritty/alacritty.git ~/.sources/alacritty
sudo cp ~/.sources/alacritty/extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
sudo desktop-file-install ~/.sources/alacritty/extra/linux/Alacritty.desktop
sudo update-desktop-database

echo "Installing alacritty manual"
sudo mkdir -p /usr/local/share/man/man1
gzip -c ~/.sources/alacritty/extra/alacritty.man | sudo tee /usr/local/share/man/man1/alacritty.1.gz > /dev/null

echo "Use alacritty by default"
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator $CARGO_HOME/bin/alacritty 50

echo "Installing Jetbrains font"
mkdir -p ~/.local/share/fonts
wget "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/JetBrainsMono.zip" -O jetbrainsfont.zip
unzip jetbrainsfont.zip -d "$HOME/.local/share/fonts"
rm -f jetbrainsfont.zip
gsettings set org.gnome.desktop.interface font-name "JetBrainsMono Nerd Font Regular 10"
gsettings set org.gnome.desktop.interface document-font-name "JetBrainsMono Nerd Font Regular 10"
gsettings set org.gnome.desktop.interface monospace-font-name "JetBrainsMono Nerd Font Regular 10"


echo "Installing fnm node version manager"
cargo install fnm

echo "Installing Regolith"
sudo add-apt-repository ppa:regolith-linux/release
sudo apt install regolith-desktop-mobile -y # or regolith-desktop-standard

echo "Regolith theme"
sudo apt install regolith-look-ayu-dark -y

echo "GTK theme"
gsettings set org.gnome.desktop.interface gtk-theme "Ayu-Dark"

echo "installing zinit"
git clone https://github.com/zdharma/zinit.git ~/.sources/zinit

echo "installing docker"
sudo apt install -y apt-transport-https ca-certificates curl gnupg lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io
sudo usermod -aG docker $USER

echo "installing gcloud & kubectl"
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
sudo apt update && sudo apt install google-cloud-sdk kubectl -y
gcloud init

echo "installing k9s"
curl -sS https://webinstall.dev/k9s | bash

echo "installing docker-compose"
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

echo "installing helmenv helm version manager"
sudo apt install jq -y
git clone https://github.com/alexppg/helmenv.git ~/.local/share/helm
