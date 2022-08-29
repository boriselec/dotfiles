call plug#begin()
Plug 'boriselec/intellij.vim'
Plug 'itchyny/lightline.vim'
Plug 'kovisoft/slimv'
call plug#end()

set termguicolors
set background=light
colorscheme intellij
let g:lightline = {'colorscheme': 'intellij'}

" Highlight all instances of word under cursor
function! AutoHighlightToggle()
  au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
  setl updatetime=175
endfunction

source ~/.vimrc_common
