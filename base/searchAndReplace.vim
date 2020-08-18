Plug 'brooth/far.vim'
" Plug 'dyng/ctrlsf.vim'

function! s:farConfig()
    no <leader>R :Far 
    let g:far#source = 'agnvim'
    " fix scrolling issue in results
    " set regexpengine=1 " nvim will be in fake-freeze in some situation, press 'q' to recover
endfunction

function! s:ctrlsfConfig()
    no <leader>R :CtrlSF 
endfunction

function! s:SnRConfig()
    " call s:ctrlsfConfig()
    call s:farConfig()
endfunction
call s:SnRConfig()
