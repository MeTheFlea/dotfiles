scriptencoding utf-8
set encoding=utf-8

set nocp ai number incsearch hlsearch cindent showcmd ignorecase smartcase nocompatible
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

if has('nvim')
  " enter insert mode when opening a terminal automatically
  autocmd TermOpen * startinsert
endif

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
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'sheerun/vim-polyglot'
Plug 'lervag/wiki.vim'
Plug 'tpope/vim-eunuch'
Plug 'rust-lang/rust.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'lambdalisue/suda.vim'
Plug 'octol/vim-cpp-enhanced-highlight'
call plug#end()
" -------------------
"coloured theme stuff
set t_Co=256
colorscheme base16-atelier-seaside
" -------------------
"goyo
let g:goyo_height = '90%'
" -------------------
"coc
let g:coc_config_home = '~/.vim/'

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming. (alt shift R)
nmap <A-S-R> <Plug>(coc-rename)

" Use C-Space to show documentation in preview window.
nnoremap <silent> <C-Space> :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif
" -------------------
"lvimrc
let g:localvimrc_sandbox = 0
let g:localvimrc_ask = 0
" -------------------
"wiki.vim
let g:wiki_root = '~/wiki'
let g:wiki_filetypes = ['md']
let g:wiki_link_extension = '.md'
let g:wiki_link_target_type = 'md'
" -------------------
"lightline
set noshowmode
set laststatus=2

let g:lightline = {
    \ 'colorscheme' : 'default',
    \ 'active' : {
    \ 'left': [ [ 'mode', 'paste' ],
    \           [ 'readonly', 'relativepath', 'modified' ] ],
    \ 'right': [ [ 'lineinfo' ],
    \            [ 'percent' ],
    \            [ 'fileformat', 'fileencoding', 'filetype' ] ]
    \ },
    \ 'inactive' : {
    \ 'left': [ [ 'relativepath' ] ],
    \ 'right': [ [ 'lineinfo' ],
    \            [ 'percent' ] ]
    \ },
    \ }
" -------------------
"rooter
let g:rooter_silent_chdir = 1
let g:rooter_patterns = [ '.git/', '.sln', '.lvimrc', 'Cargo.lock' ]
let g:rooter_cd_cmd = "lcd"
" -------------------
"cpp-enhanced-highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
" -------------------

function! SourceIfExists( filename )
	if filereadable(glob(a:filename))
		exe "source " . glob(a:filename)
	endif
endfunction
autocmd Filetype rust call SourceIfExists( "~/.vimrc.rust" )

"load local vimrc
call SourceIfExists( "~/.vimrc.local" )
