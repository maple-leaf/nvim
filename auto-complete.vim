""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               Auto complete                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" if encounter `failed to load python host`, see https://github.com/Shougo/deoplete.nvim/issues/31
"Plug 'Shougo/deoplete.nvim'
"Plug 'carlitux/deoplete-ternjs'
"Plug 'mhartington/deoplete-typescript'
"Plug 'Shougo/neco-vim' "vim source

Plug 'Valloric/YouCompleteMe', {'do': './install.py --all'}
"Plug 'mkusher/padawan.vim'

Plug 'artur-shaik/vim-javacomplete2' "java source
Plug 'shawncplus/phpcomplete.vim'


""""""""""""
"  Config  "
""""""""""""

function! s:deopleteConfig()
    let g:deoplete#enable_at_startup = 1

    imap <silent><expr><TAB>  pumvisible() ? "\<C-n>" :  "\<TAB>"
    inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<C-h>"
endfunction
call s:deopleteConfig()

let g:padawan#composer_command = "composer"
let g:ycm_semantic_triggers = {}
let g:ycm_semantic_triggers.php =
\ ['->', '::', '(', 'use ', 'namespace ', '\']

""""""""""
"  JAVA  "
""""""""""
autocmd FileType java setlocal omnifunc=javacomplete#Complete

"""""""""
"  PHP  "
"""""""""
let g:phpcomplete_index_composer_command = "composer"
autocmd  FileType  php setlocal omnifunc=phpcomplete#CompletePHP
