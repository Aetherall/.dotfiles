source ~/.config/vim/autoload/plug.vim
call plug#begin('~/.config/vim/autoload')
Plug 'vim-airline/vim-airline'
Plug 'frazrepo/vim-rainbow'
call plug#end()

let g:rainbow_active = 1
let g:raingow_guifgs = ['DarkOrange3', 'DarkOrchid3', 'FireBrick' , 'Green','DarkOrange3', 'DarkOrchid3', 'FireBrick' , 'Green']

" BASIC
syntax on
set number