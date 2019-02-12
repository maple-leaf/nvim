" For async completion
Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/echodoc.vim'

function! s:autoCompleteConfig()
    let g:deoplete#enable_at_startup = 1
    "let g:echodoc#enable_at_startup = 1

    augroup autoComplete
        autocmd!
        autocmd CompleteDone * call s:on_complete_done()
        "autocmd InsertLeave * call s:on_insert_leave()
    augroup END
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

function! s:on_complete_done() abort
    let item = get(v:, 'completed_item', {})
    if type(item) == 4
        echom get(item, 'menu')
    endif
endfunction

Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}

function! s:tsConfig()
    let g:nvim_typescript#javascript_support = 1
    let g:nvim_typescript#vue_support = 1
    let g:nvim_typescript#diagnostics_enable = 0
    augroup tsAuto
	autocmd!
	autocmd BufEnter *.js,*.ts,*.tsx,*.jsx,*.vue call s:tsKeys()
    augroup END
endfunction
call s:tsConfig()

function! s:tsKeys()
    no gd :TSDef<cr>
    no gh :TSType<cr>
endfunction
