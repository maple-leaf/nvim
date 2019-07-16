" introduce different ability by plugin

Plug 'terryma/vim-multiple-cursors'

" draw flowchart easily
Plug 'gyim/vim-boxdraw'

function! s:drawEnable()
    set virtualedit+=all " able to visual select beyond end of line
endfunction

function! s:drawDisable()
    set virtualedit-=all " unable to visual select beyond end of line
endfunction

command! DrawEnable call s:drawEnable()
command! DrawDisable call s:drawDisable()

" Auto close parentheses and repeat by dot dot dot...
" disable for issue with 'yats' plugin
" check issue: https://github.com/cohama/lexima.vim/issues/84
"Plug 'cohama/lexima.vim'
