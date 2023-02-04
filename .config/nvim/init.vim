call plug#begin()
Plug 'boriselec/intellij.vim'
Plug 'itchyny/lightline.vim'
Plug 'kovisoft/slimv'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'airblade/vim-gitgutter'
call plug#end()

set background=light

set signcolumn=yes:1
" fix signcolor background"
" https://github.com/airblade/vim-gitgutter/issues/696#issuecomment-944809679
highlight! link SignColumn LineNr
autocmd ColorScheme * highlight! link SignColumn LineNr

let g:python3_host_prog = '/opt/homebrew/bin/python3'

source ~/.vimrc_common
