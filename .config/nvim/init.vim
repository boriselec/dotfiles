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

let g:slimv_swank_cmd = '!osascript -e
\ "tell application \"Terminal\" to do script
\ \"cd personal/swank-racket &&
\ /Users/16676965/personal/Racket\\\\ v8.6/bin/racket server.rkt\""'

" move repl window
function! SlimvConnectServerAndResize()
  call SlimvConnectServer()
  wincmd H
  vertical resize 84
endfunction
" startup: run repl
autocmd VimEnter * call SlimvConnectServerAndResize()
" startup: remap slimv connect binding
autocmd VimEnter * nnoremap ,c :call SlimvConnectServerAndResize()<CR>

source ~/.vimrc_common
