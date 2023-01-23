source ~/.config/nvim/init.vim

colorscheme intellij
let g:lightline = {'colorscheme': 'intellij'}

syntax on
set termguicolors
set laststatus=3

nmap <A-j> ]c
nmap <A-k> [c
nmap <A-r> \hu

" Highlight all instances of word under cursor
function! AutoHighlightToggle()
  au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
  au CursorHold * set hlsearch
  setl updatetime=175
endfunction

let g:slimv_swank_cmd = '!osascript -e
\ "tell application \"Terminal\" to do script
\ \"/Users/boris/.config/nvim/slimv_server.sh && exit\""'

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

" go to next/prev method
set nowrapscan
nnoremap <C-l> :set nohlsearch<CR>/^[^ \t\r\n\v\f;]<CR>:echo<CR>
nnoremap <C-h> :set nohlsearch<CR>_?^[^ \t\r\n\v\f;]<CR>:echo<CR>

lua << EOF
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
  hijack_cursor = true,
  open_on_tab = true,
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
    highlight_opened_files = 'name',
    icons = {
      show = {
        file = false,
        folder = false,
        folder_arrow = false
      }
    }
  }
})
EOF

autocmd VimEnter * NvimTreeFindFileToggle
autocmd VimEnter * wincmd w
autocmd VimEnter * lua require("set_project_root")
