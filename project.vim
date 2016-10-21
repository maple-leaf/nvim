""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              project manager                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" vim sessions
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'

""""""""""""
"  Config  "
""""""""""""

function! SessionConfig()
    call EnsureDirExists($XDG_DATA_HOME . '/nvim/sessions/')
    set sessionoptions-=help
    let g:session_directory = $XDG_DATA_HOME . '/nvim/sessions/'
    let g:session_autosave = 'yes'
    let g:session_autoload = 'no'
    let g:session_default_name = "last"
    no ms :SaveSession 
    no \s :OpenSession 
endfunction
call SessionConfig()

