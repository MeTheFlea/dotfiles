" can use same filenames on all platforms
if has('win32') || has('win64')
	set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
endif

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
nmap <F1> :Ex<CR>
"write as sudo
cmap w!! w !sudo tee > /dev/null %
" -------------------
" fzf
nmap <C-P> :Files<CR>
nmap <C-B> :Buffers<CR>
" -------------------
" goyo
nmap <Leader>g :Goyo<CR>

" -------------------
" PLUGINS
" -------------------
call plug#begin('~/.vim/plugged')
Plug 'https://github.com/embear/vim-localvimrc.git'
Plug 'https://github.com/airblade/vim-rooter.git'
Plug 'https://github.com/junegunn/fzf', { 'dir': '~/.fzf' }
Plug 'https://github.com/junegunn/fzf.vim'
Plug 'https://github.com/itchyny/lightline.vim'
Plug 'https://github.com/junegunn/goyo.vim'
Plug 'https://github.com/junegunn/vim-peekaboo'
call plug#end()

" -------------------
"goyo
let g:goyo_height = '95%'
" -------------------
"lvimrc
let g:localvimrc_sandbox = 0
" -------------------
"lightline
set noshowmode
set laststatus=2
" -------------------
"rooter
let g:rooter_silent_chdir = 1
let g:rooter_patterns = [ '.git/', '.lvimrc' ]
let g:rooter_use_lcd = 1
" -------------------

