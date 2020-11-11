scriptencoding utf-8
set encoding=utf-8

set nocp ai number incsearch hlsearch cindent showcmd ignorecase nocompatible
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

set tags=./tags;/

"disable defaulting to a commented line when pressing enter in a comment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" -------------------
" ALIASES
" -------------------
" f1 for file explorer
nnoremap <F1> :Ex<CR>
"write as sudo
cnoremap ww w suda://%
" -------------------
" fzf
nnoremap <C-P> :Files<CR>
nnoremap <C-N> :Tags<CR>
nnoremap <C-M> :BTags<CR>
nnoremap <C-B> :Buffers<CR>
nnoremap <Leader>p :silent !ctags -R .<CR>
" -------------------
" goyo
nnoremap <Leader>g :Goyo<CR>
" clear search highlighting
nnoremap <silent> <Leader>c :nohlsearch<CR>

" -------------------
" PLUGINS
" -------------------
call plug#begin('~/.vim/plugged')
Plug 'MeTheFlea/base16-vim'
Plug 'godlygeek/csapprox'
Plug 'embear/vim-localvimrc'
Plug 'MeTheFlea/vim-rooter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'sheerun/vim-polyglot'
Plug 'vimwiki/vimwiki'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-eunuch'
Plug 'rust-lang/rust.vim'
Plug 'MeTheFlea/ale'
Plug 'OmniSharp/omnisharp-vim'
Plug 'lambdalisue/suda.vim'
call plug#end()
" -------------------
"coloured theme stuff
set t_Co=256
colorscheme base16-atelier-seaside
" -------------------
"omnisharp
let g:OmniSharp_server_stdio = 1
" -------------------
"ale
" auto complete on cspace
inoremap <silent> <C-Space> <C-\><C-O>:ALEComplete<CR>
" auto complete on .
inoremap <silent> <expr> . "." . "\<c-\>\<c-o>:ALEComplete\<CR>"

" select menu item with tab
inoremap <expr> <Tab> pumvisible() ? "\<C-y>" : "\<C-g>u\<Tab>"

" dont auto insert selection
set completeopt=menu,menuone,preview,noinsert

autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
set signcolumn=yes
set splitbelow
let g:ale_set_quickfix = 1
let g:ale_set_loclist = 0
let g:ale_open_list = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_linters = {
	\ 'rust': ['rls'],
	\ 'cs': ['OmniSharp'],
\}
nnoremap <silent> gd :ALEGoToDefinition<CR>
nnoremap <silent> <F2> :ALERename<CR>
nnoremap <silent> <C-Space> :ALEHover<CR>
" -------------------
"goyo
let g:goyo_height = '90%'
" -------------------
"lvimrc
let g:localvimrc_sandbox = 0
let g:localvimrc_ask = 0
" -------------------
"vimwiki
let g:vimwiki_list = [{'path': '~/wiki/', 'syntax': 'markdown', 'ext': '.md'}]
" -------------------
"lightline
set noshowmode
set laststatus=2
" -------------------
"rooter
let g:rooter_silent_chdir = 1
let g:rooter_patterns = [ '.git/', '.sln', '.lvimrc', 'Cargo.lock' ]
let g:rooter_use_lcd = 1
let g:rooter_check_all_patterns = 1
" -------------------

function! SourceIfExists( filename )
	if filereadable(glob(a:filename))
		exe "source " . glob(a:filename)
	endif
endfunction
autocmd Filetype rust call SourceIfExists( "~/.vimrc.rust" )

"load local vimrc
call SourceIfExists( "~/.vimrc.local" )
