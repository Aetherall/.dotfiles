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