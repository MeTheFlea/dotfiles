" can use same filenames on all platforms
if has('win32') || has('win64')
	set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
endif

scriptencoding utf-8
set encoding=utf-8

set nocp ai number relativenumber incsearch hlsearch cindent showcmd ignorecase nocompatible
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

set omnifunc=syntaxcomplete#Complete

"disable autocomments
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" -------------------
" ALIASES
" -------------------
" f1 for file explorer
nnoremap <F1> :Ex<CR>
"write as sudo
cnoremap w!! w !sudo tee > /dev/null %
" -------------------
" fzf
nnoremap <C-P> :Files<CR>
nnoremap <C-B> :Buffers<CR>
" -------------------
" goyo
nnoremap <Leader>g :Goyo<CR>
" clear hl
nnoremap <Leader>c :nohlsearch<CR>

" -------------------
" PLUGINS
" -------------------
call plug#begin('~/.vim/plugged')
Plug 'https://github.com/w0ng/vim-hybrid.git'
Plug 'https://github.com/embear/vim-localvimrc.git'
Plug 'https://github.com/airblade/vim-rooter.git'
Plug 'https://github.com/junegunn/fzf', { 'dir': '~/.fzf' }
Plug 'https://github.com/junegunn/fzf.vim'
Plug 'https://github.com/itchyny/lightline.vim'
Plug 'https://github.com/junegunn/goyo.vim'
Plug 'https://github.com/junegunn/vim-peekaboo'
Plug 'https://github.com/vimwiki/vimwiki'
Plug 'https://github.com/christoomey/vim-tmux-navigator.git'
call plug#end()
" -------------------
"coloured theme stuff
set t_Co=256
set background=dark
colorscheme hybrid
" -------------------
"goyo
let g:goyo_height = '90%'
" -------------------
"lvimrc
let g:localvimrc_sandbox = 0
let g:localvimrc_ask = 0
" -------------------
"vimwiki
let g:vimwiki_list = [{'path': '~/wiki/raw/', 'path_html': '~/wiki/html/'}]
" -------------------
"lightline
set noshowmode
set laststatus=2
" -------------------
"rooter
let g:rooter_silent_chdir = 1
let g:rooter_patterns = [ '.git/', '.lvimrc', '.sln' ]
let g:rooter_use_lcd = 1
