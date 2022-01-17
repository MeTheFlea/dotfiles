if exists(':GuiFont')
	GuiFont Hack:h10
else
	set guifont=Hack:h10
endif
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L
set guioptions-=e

" disable bell sound
autocmd GUIEnter * set vb t_vb=
