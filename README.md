# Aetherall's .dotfiles

## How to use ?

open a terminal and paste this:

```
sudo apt install git curl -y
git clone https://github.com/Aetherall/.dotfiles ~/.dotfiles
cd ~/.dotfiles
source .env
sh link.sh
sh install.sh | tee -a ~/.dotfiles/install.log
```

## TODO

- [x] sh
- [x] bash
- [x] zsh
- [x] zsh theme
- [x] vim
- [x] rust
- [x] alacritty
- [x] fonts
- [x] fnm
- [x] htop
- [?] gnupg
- [?] ssh
- [x] i3
- [x] automate fonts
- [?] git config ( perso + gojob )
- [x] auto theme gtk
- [x] auto theme regolith
- [x] vim edit command
- [x] better ls
- [x] zsh history
- [ ] swap escape caps lock
- [ ] vscode config
- [ ] install yarn
- [x] gcloud
- [x] kubectl
- [x] k9s
- [x] zsh plugins
- [ ] nnn

### Fix for dell XPS 15 7590

/boot/grub/grub.cfg => add i915.edp_vswing=2 acpi=force
