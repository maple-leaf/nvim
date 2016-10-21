""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 Git Tools                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'jreybert/vimagit'

""""""""""""
"  Config  "
""""""""""""

function! s:fugittiveConfig()
    nmap <Leader>gs <Plug>GitGutterStageHunk
    nmap <Leader>gr <Plug>GitGutterRevertHunk
    nmap <Leader>gp <Plug>GitGutterPreviewHunk
    nmap <Leader>gn <Plug>GitGutterNextHunk
endfunction
call s:fugittiveConfig()

function! s:vimgitConfig()
    let g:magit_discard_untracked_do_delete = 1
endfunction
call s:vimgitConfig()
