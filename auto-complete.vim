""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               Auto complete                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:completeMethod = 'nvm' " nvm, deoplete, ycm

""""""""""""""""""""""""
"  Completion Manager  "
""""""""""""""""""""""""

if g:completeMethod == 'nvm'
    " TODO: upgrade to https://github.com/ncm2/ncm2
    Plug 'roxma/nvim-completion-manager'
elseif g:completeMethod == 'deoplete'
    " if encounter `failed to load python host`, see https://github.com/Shougo/deoplete.nvim/issues/31
    Plug 'Shougo/deoplete.nvim'
elseif g:completeMethod == 'ycm'
    Plug 'Valloric/YouCompleteMe', {'do': './install.py --all'}
endif


"""""""""""""
"  Snippets  "
"""""""""""""
" Group dependencies, vim-snippets depends on ultisnips
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets' | Plug 'maple-leaf/UltiSnips-ext'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'

function! UltiSnipsConfig()
    let g:UltiSnipsExpandTrigger = '<c-k>'
    let g:UltiSnipsJumpForwardTrigger = '<c-k>'
    let g:UltiSnipsJumpBackwardTrigger = '<c-i>'
    let g:UltiSnipsEditSplit = 'horizontal'
    if isdirectory($XDG_DATA_HOME . '/nvim/plugged/UltiSnips-ext')
        let g:UltiSnipsSnippetsDir = $XDG_DATA_HOME . '/nvim/plugged/UltiSnips-ext/UltiSnips/'
    endif
endfunction
" call UltiSnipsConfig()

function! NeoSnippetConfig()
    imap <C-k>     <Plug>(neosnippet_expand_or_jump)
    smap <C-k>     <Plug>(neosnippet_expand_or_jump)
    xmap <C-k>     <Plug>(neosnippet_expand_target)
    " expand parameters
    let g:neosnippet#enable_completed_snippet=1
endfunction
call NeoSnippetConfig()

"""""""""""""
"  Sources  "
"""""""""""""

Plug 'Shougo/neco-vim' " vimscript source
Plug 'othree/csscomplete.vim' " css completion

if g:completeMethod == 'nvm'
    Plug 'roxma/ncm-flow', {'do': 'npm install'}" js completion
elseif g:completeMethod == 'deoplete'
    Plug 'carlitux/deoplete-ternjs'
    Plug 'mhartington/deoplete-typescript'
    Plug 'zchee/deoplete-go', { 'do': 'make'} " golang completion
endif

""""""""""""
"  Config  "
""""""""""""

function! s:nvmConfig()
    set shortmess+=c
    " inoremap <expr> <CR> (pumvisible() ? "\<c-k>\<cr>" : "\<CR>")
    imap <expr> <CR>  (pumvisible() ?  "\<c-y>\<Plug>(expand_or_nl)" : "\<CR>")
    imap <expr> <Plug>(expand_or_nl) (cm#completed_is_snippet() ? "\<C-k>":"\<CR>")
    " css completion via `csscomplete#CompleteCSS`
    " The `'cm_refresh_patterns'` is PCRE.
    " Be careful with `'scoping': 1` here, not all sources, especially omnifunc,
    " can handle this feature properly.
    au User CmSetup call cm#register_source({'name' : 'cm-css',
                \ 'priority': 9, 
                \ 'scoping': 1,
                \ 'scopes': ['css','scss'],
                \ 'abbreviation': 'css',
                \ 'cm_refresh_patterns':[':\s+\w*$'],
                \ 'cm_refresh': {'omnifunc': 'csscomplete#CompleteCSS'},
                \ })
endfunction

function! s:deopleteConfig()
    let g:deoplete#enable_at_startup = 1

    imap <silent><expr><TAB>  pumvisible() ? "\<C-n>" :  "\<TAB>"
    inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<C-h>"

    " go config
    let g:deoplete#sources#go#use_cache = 1
    let g:deoplete#sources#go#json_directory = '~/.cache/deoplete/go/$GOOS_$GOARCH'
endfunction

function! s:ycmConfig()
    let g:ycm_semantic_triggers = {}
    let g:ycm_semantic_triggers.php =
                \ ['->', '::', '(', 'use ', 'namespace ', '\']
endfunction


if g:completeMethod == 'nvm'
    call s:nvmConfig()
elseif g:completeMethod == 'deoplete'
    call s:deopleteConfig()
elseif g:completeMethod == 'ycm'
    call s:ycmConfig()
endif
