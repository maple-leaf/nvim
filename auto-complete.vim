""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               Auto complete                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" if encounter `failed to load python host`, see https://github.com/Shougo/deoplete.nvim/issues/31
Plug 'Shougo/deoplete.nvim'
Plug 'carlitux/deoplete-ternjs'
Plug 'mhartington/deoplete-typescript'
Plug 'Shougo/neco-vim' "vim source


""""""""""""
"  Config  "
""""""""""""

function! s:deopleteConfig()
    let g:deoplete#enable_at_startup = 1

    imap <silent><expr><TAB>  pumvisible() ? "\<C-n>" :  "\<TAB>"
    inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<C-h>"
endfunction
call s:deopleteConfig()

