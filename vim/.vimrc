" can use same filenames on all platforms
if has('win32') || has('win64')
	set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
endif

scriptencoding utf-8
set encoding=utf-8

set nocp ai number relativenumber incsearch hlsearch cindent showcmd ignorecase
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
Plug 'https://github.com/christoomey/vim-tmux-navigator.git'
Plug 'https://github.com/autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }

if has('nvim')
	Plug 'https://github.com/Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
	Plug 'https://github.com/Shougo/deoplete.nvim'
	Plug 'https://github.com/roxma/nvim-yarp'
	Plug 'https://github.com/roxma/vim-hug-neovim-rpc'
endif

call plug#end()
" -------------------
"languageclient
set hidden

let g:LanguageClient_serverCommands = {
			\ 'cpp': ['clangd'],
			\ 'javascript': ['javascript-typescript-stdio'],
			\ }
" -------------------
"deoplete
let g:deoplete#enable_at_startup = 1
set pyxversion=3
imap <expr> <Tab> pumvisible() ? deoplete#close_popup() : "\<Tab>"
call deoplete#custom#option({
\ 'auto_complete_delay': 0,
\ })
<
" -------------------
"coloured theme stuff
set t_Co=256
set background=dark
colorscheme hybrid
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
let g:rooter_patterns = [ '.git/', '.lvimrc', '.sln' ]
let g:rooter_use_lcd = 1
