sudo apt install git -y
git clone https://github.com/Aetherall/.dotfiles ~/.dotfiles
cd ~/.dotfiles
source .env
sh link.sh
sh install.sh