#!/bin/bash

# Translates a sentence using deepl.io
# Usage: translate <target_language_code> <message>
# Example: translate fr message
# 
# In order for this to work:
# - create a free account at https://www.deepl.com/pro-api?cta=checkout-pro#api-pricing
# - retrieve your api key
# - run: `echo "DEEPL_FREE_API_KEY=xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx:xx" >> ~/.dotfiles/private/.env`

translate() {
  url="https://api-free.deepl.com/v2/translate"
  key=$DEEPL_FREE_API_KEY

  target=$(echo $1 | tr a-z A-Z)
  
  result=$(curl -s $url -d auth_key=$key -d "text=$2" -d "target_lang=$target") 
 
  translation=$(echo $result | jq -r '.translations[0].text' -)
  source=$(echo $result | jq -r '.translations[0].detected_source_language' -)

  echo "$source -> $target :"
  echo $translation
}


#ZSH
alias refresh="source ~/.dotfiles/zsh/.zshrc"
alias cl="clear"
alias zshrc="code ~/.dotfiles/aliases.bash"
alias zshrc-private="code ~/.dotfiles/private/aliases.bash"

# Alias CD
alias gojob="cd ~/gojob"
alias cs="cd ~/gojob/clic-and-staff/"
alias home="cd ~/"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

#Deepshit
alias ghost="echo gs -sDEVICE=txtwrite -o .txt .pdf"


# git
alias gc="git commit -m"
alias gco="git checkout"
alias gp="git push origin HEAD"
alias gp-f="git push -f origin HEAD"
alias gl="git pull"
alias gst="git status"	
alias ga="git add"
alias gcln="git clone"
alias glo="git log"

#Deepshit
alias ghost="echo gs -sDEVICE=txtwrite -o .txt .pdf"
