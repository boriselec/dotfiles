call plug#begin()
Plug 'boriselec/intellij.vim'
Plug 'itchyny/lightline.vim'
call plug#end()

set termguicolors
set background=light
colorscheme intellij
let g:lightline = {'colorscheme': 'intellij'}

source ~/.vimrc_common
