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
cnoremap w!! w !sudo tee > /dev/null %
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
Plug 'dense-analysis/ale'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
call plug#end()
" -------------------
"coloured theme stuff
set t_Co=256
colorscheme base16-atelier-seaside
" -------------------
"deoplete
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option({
	\ 'auto_complete': 1,
	\ 'auto_complete_popup': "manual",
	\ 'sources': {
	\ '_': ['ale'],
	\}
\ })
inoremap <expr> <C-Space> deoplete#complete()
" -------------------
"ALE
set signcolumn=yes
let g:ale_set_quickfix = 1
let g:ale_set_loclist = 0
let g:ale_open_list = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_linters = {
	\ 'rust': ['rls'],
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
let g:rooter_patterns = [ '.git/', '.sln', '.lvimrc', 'Cargo.toml' ]
let g:rooter_use_lcd = 1
let g:rooter_check_all_patterns = 1
" -------------------
"load local vimrc
if filereadable(glob("~/.vimrc.local"))
	source ~/.vimrc.local
endif
