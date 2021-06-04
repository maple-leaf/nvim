" introduce different ability by plugin

Plug 'terryma/vim-multiple-cursors'

" plantUML preview in vim with text graphic
Plug 'scrooloose/vim-slumlord'

" easy to change surrounded symbol by 'cs' or delete by 'ds'
Plug 'tpope/vim-surround'

" extend text object
Plug 'wellle/targets.vim'

function! s:drawEnable()
    set virtualedit+=all " able to visual select beyond end of line
endfunction

function! s:drawDisable()
    set virtualedit-=all " unable to visual select beyond end of line
endfunction

command! DrawEnable call s:drawEnable()
command! DrawDisable call s:drawDisable()

" Auto close parentheses and repeat by dot dot dot...
Plug 'cohama/lexima.vim'

" (Do)cumentation (Ge)nerator
Plug 'kkoomen/vim-doge'

" string converstaion
Plug 'tpope/vim-abolish'

" debug IDE
Plug 'puremourning/vimspector'
