"Plug 'ncm2/ncm2'

" For async completion
Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/echodoc.vim'

function! s:autoCompleteConfig()
    let g:echodoc#enable_at_startup = 1
endfunction

function! s:cmdlineComplete()
    " set ignore file extension of wildmenu, won't list when using filename completion
    set wildmenu
    set wildignore+=*.a,*.o,.DS_Store,.git,.hg,.svn,*~,*.swp,*.tmp,*/.sass-cache/*,*.scssc
    set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
endfunction

call s:autoCompleteConfig()
call s:cmdlineComplete()
