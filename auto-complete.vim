""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               Auto complete                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" if encounter `failed to load python host`, see https://github.com/Shougo/deoplete.nvim/issues/31
Plug 'Shougo/deoplete.nvim'
Plug 'carlitux/deoplete-ternjs'
Plug 'mhartington/deoplete-typescript'
Plug 'Shougo/neco-vim' "vim source
Plug 'zchee/deoplete-go', { 'do': 'make'}

"Plug 'Valloric/YouCompleteMe', {'do': './install.py --all'}

Plug 'artur-shaik/vim-javacomplete2' "java source

"Plug 'mkusher/padawan.vim'
Plug 'shawncplus/phpcomplete.vim'


""""""""""""
"  Config  "
""""""""""""

function! s:deopleteConfig()
    let g:deoplete#enable_at_startup = 1

    imap <silent><expr><TAB>  pumvisible() ? "\<C-n>" :  "\<TAB>"
    inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<C-h>"

    " go config
    let g:deoplete#sources#go#use_cache = 1
    let g:deoplete#sources#go#json_directory = '~/.cache/deoplete/go/$GOOS_$GOARCH'
endfunction
call s:deopleteConfig()

function! s:ycmConfig()
    "let g:ycm_semantic_triggers = {}
    "let g:ycm_semantic_triggers.php =
    "\ ['->', '::', '(', 'use ', 'namespace ', '\']
endfunction

""""""""""
"  JAVA  "
""""""""""
autocmd FileType java setlocal omnifunc=javacomplete#Complete

"""""""""
"  PHP  "
"""""""""
"let g:padawan#composer_command = "composer"
let g:phpcomplete_index_composer_command = "composer"
autocmd  FileType  php setlocal omnifunc=phpcomplete#CompletePHP
