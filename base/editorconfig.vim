Plug 'editorconfig/editorconfig-vim'

function! s:editorconfig()
    let g:EditorConfig_exclude_patterns = ['fugitive://.\*', 'scp://.\*']
endfunction
call s:editorconfig()
