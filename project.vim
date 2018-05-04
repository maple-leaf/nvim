""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              project manager                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" vim sessions
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'

""""""""""""
"  Config  "
""""""""""""

function! s:closeAllTerminalAndOpenSeesion(sessionName)
    :BD! term:
    execute 'OpenSession ' . a:sessionName
endfunction

command! -nargs=1 TcloseAllAndOpenSession call s:closeAllTerminalAndOpenSeesion('<args>')

function! SessionConfig()
    call EnsureDirExists($XDG_DATA_HOME . '/nvim/sessions/')
    set sessionoptions-=help
    let g:session_directory = $XDG_DATA_HOME . '/nvim/sessions/'
    let g:session_autosave = 'yes'
    let g:session_autoload = 'no'
    let g:session_default_name = "last"
    no ms :SaveSession 
    no \s :TcloseAllAndOpenSession 
endfunction
call SessionConfig()

