echo "~/.dotfiles/zsh/.zshrc"

fpath+="$ZDOTDIR/.zsh_functions"

source ~/.sources/zinit/zinit.zsh

# Two regular plugins loaded without investigating.
zinit light zsh-users/zsh-autosuggestions
zinit load zsh-users/zsh-history-substring-search
zinit light zsh-users/zsh-completions
zinit light zdharma/fast-syntax-highlighting

setopt histignorealldups
setopt sharehistory
setopt appendhistory
setopt histfindnodups
setopt incappendhistory
setopt histreduceblanks
setopt correct
setopt correctall
setopt globcomplete
setopt nocaseglob

# Keep 1 200 000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1200000
SAVEHIST=1000000
HISTFILE=~/.config/zsh/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'


# Use ctrl+UP ctrl+DOWN to navigate history
bindkey '^[[1;5A' history-substring-search-up
bindkey '^[[1;5B' history-substring-search-down

# Use ctrl+LEFT ctrl+RIGHT to move word by word
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# Use ctrl+e for open current command in editor
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^E" edit-command-line



eval "$(fnm env)"
eval "$(starship init zsh)"

if [ -f "$HOME/.dotfiles/private/aliases.bash" ]; then
  . "$HOME/.dotfiles/private/aliases.bash";
fi