if has("win32")
	if exists( 'g:GuiLoaded' ) "checks for nvim-qt
		GuiFont! Hack:h10
	else
		set guifont=Hack:h10
	endif
else
	set guifont=Hack\ 10
endif
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L
set guioptions-=e

" disable bell sound
autocmd GUIEnter * set vb t_vb=
