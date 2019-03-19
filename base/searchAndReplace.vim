Plug 'brooth/far.vim'

function! s:snRConfig()
    no <leader>R :Far 
    let g:far#source = 'agnvim'
    " fix scrolling issue in results
    set regexpengine=1
    " nvim will be in fake-freeze in some situation, press 'q' to recover
endfunction
call s:snRConfig()
