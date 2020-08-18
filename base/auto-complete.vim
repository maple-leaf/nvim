" For async completion
Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/echodoc.vim'

"""""""""""""
"  sources  "
"""""""""""""
Plug 'Shougo/neco-vim'

function! s:autoCompleteConfig()
    let g:deoplete#enable_at_startup = 1

	" echodoc not working correctly, do it myself
    "let g:echodoc#enable_at_startup = 1
    augroup autoComplete
        autocmd!
        autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | silent! pclose | endif
    augroup END

    """""""""""""
    "  echodoc  "
    """""""""""""
    let g:echodoc#enable_at_startup = 1
    let g:echodoc#type = 'floating'
    " To use a custom highlight for the float window,
    " change Pmenu to your highlight group
    highlight link EchoDocFloat Pmenu
endfunction

function! s:cmdlineComplete()
    " set ignore file extension of wildmenu, won't list when using filename completion
    set wildmenu
    set wildignore+=*.a,*.o,.DS_Store,.git,.hg,.svn,*~,*.swp,*.tmp,*/.sass-cache/*,*.scssc
    set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
    set shortmess+=c
endfunction

call s:autoCompleteConfig()
call s:cmdlineComplete()
