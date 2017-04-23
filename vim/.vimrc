scriptencoding utf-8
set encoding=utf-8

set nocp ai number relativenumber incsearch cindent showcmd
set scrolloff=5

"whitespace
set list
set listchars=tab:>-,eol:<,nbsp:%,trail:.,space:.

"backspace behaviour
set backspace=indent,eol,start

"tabs
set tabstop=4 shiftwidth=4 noexpandtab softtabstop=0

syntax on
filetype plugin indent on

"disable autocomments
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"coloured theme stuff
set t_Co=256
colorscheme hybrid

" -------------------
" ALIASES
" -------------------
" f1 for file explorer
map <F1> :Ex<CR>
"write as sudo
cmap w!! w !sudo tee > /dev/null %

" -------------------
" PLUGINS
" -------------------
call plug#begin('~/.vim/plugged')
Plug 'https://github.com/embear/vim-localvimrc.git'
Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'
Plug 'https://github.com/airblade/vim-rooter.git'
call plug#end()

" -------------------
"lvimrc
let g:localvimrc_sandbox = 0
" -------------------
" ctrlp
set wildignore+=*.obj,*.pdb,*.ilk,*.o,*.d
" -------------------
"rooter
let g:rooter_silent_chdir = 1
let g:rooter_patterns = [ '.git/', '.lvimrc' ]
let g:rooter_use_lcd = 1
" -------------------

