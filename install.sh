sudo apt update -y
sudo apt upgrade -y
sudo apt dist-upgrade -y
sudo apt autoremove -y
sudo ubuntu-drivers autoinstall

sudo apt -y install vim git curl \
  htop tmate zsh cmake pkg-config \
  libfreetype6-dev libfontconfig1-dev \
  libxcb-xfixes0-dev libxkbcommon-dev \
  python3 libegl1-mesa-dev gzip \
  apt-transport-https ca-certificates \
  curl gnupg lsb-release zsh
  
echo "installing VS Code"
sudo snap install --classic code

echo "installing Jetbrain Datagrip"
sudo snap install datagrip --classic

echo "installing Slack"
sudo snap install slack --classic

echo "installing GitKraken"
sudo snap install gitkraken --classic

echo "installing Discord"
sudo snap install discord --classic

echo "enable Snap parallel instances"
sudo snap set system experimental.parallel-instances=true

echo "install bitwaden Gojob"
sudo snap install bitwarden bitwarden_gojob

echo "install bitwarden Perso"
sudo snap install bitwarden bitwarden_perso


rm -rf ~/Templates
#rm -rf ~/Desktop

echo "changing default shell to zsh, please authorize"
chsh -s /bin/zsh

echo "installing starship theme"
sh -c "$(curl -fsSL https://starship.rs/install.sh)" -- -y

echo "Installing rust"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

echo "Installing alacritty"
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

#echo "GTK theme" waiting for ayu to be fixed before applying theme u.u
#gsettings set org.gnome.desktop.interface gtk-theme "Ayu-Dark"

echo "installing zinit"
git clone https://github.com/zdharma-continuum/zinit.git ~/.sources/zinit

echo "installing docker"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update -y
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
git clone https://github.com/alexppg/helmenv.git ~/.local/share/helm

echo "installing Filezilla"
sudo apt install filezilla

echo "installing Notion Enhanced"
echo "deb [trusted=yes] https://apt.fury.io/notion-repackaged/ /" | sudo tee /etc/apt/sources.list.d/notion-repackaged.list\
sudo apt update
sudo apt install notion-app-enhanced

echo "installing Flameshot screenshot"
sudo apt install flameshot

echo "installing Gnome Tweaks"
sudo apt install gnome-tweaks

echo "installing Android Tools"
sudo apt-get install android-tools-adb android-tools-fastboot

echo "installing qBitorrent"
sudo apt install qbittorrent

echo "installing Gparted"
sudo apt install gparted

echo "installing Google Chrome"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

echo "installing Ghostscript"
sudo apt install ghostscript

echo "installing yarn"
nvm install --global yarn

echo "delet usless software"
sudo apt remove --purge thunderbird