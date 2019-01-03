" https://github.com/mhartington/nvim-typescript/issues/185#issuecomment-425212727
set signcolumn=yes
set cul " highlight current line
highlight clear SignColumn      " SignColumn should match background for things like vim-gitgutter, vim-signify
highlight clear LineNr          " Current line number row will have same background color in relative mode.
set cc=120 " highlight 120th column
set nohls " dont highlight search keyword

set relativenumber

set autoindent                  " Indent at the same level of the previous line
set shiftwidth=4                " Use indents of 4 spaces
set expandtab                   " Tabs are spaces, not tabs
set tabstop=4                   " An indentation every four columns
set softtabstop=4               " Let backspace delete indent

set fdm=indent                  " set fold method
"set fdm=syntax                  " set fold method, this will make switching large js buffer(more than 900 lines) laggy when using 'othree/yajs.vim' plugin

" status bar
set cmdheight=2
set laststatus=2

set ignorecase    " Case insensitive search
set smartcase     " Case sensitive when uppercase present

" language and encoding stuff
set helplang="en,zh-cn"
set fileencodings=utf-8,chinese,latin-1
set fileformat=unix

"turn on that syntax highlighting
syntax on

filetype on

" make buffer files can hidden
set hidden
" don't update the display while executing macros
set lazyredraw

set scrolljump=5                " Lines to scroll when cursor leaves screen
set scrolloff=3                 " Minimum lines to keep above and below cursor

set updatetime=1000

" prevent '<esc>' delay in terminal http://stackoverflow.com/a/33957679/2326199
set ttimeout
set ttimeoutlen=100

set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too


" warn me when files change outside
augroup improved_autoread
    autocmd!
    autocmd FocusGained * silent! checktime
    autocmd BufEnter * silent! checktime
augroup end
noremap <c-z> :suspend<cr>:silent! checktime<cr>

augroup better_defaults
    autocmd!
    " Remove trailing whitespaces and ^M chars
    autocmd FileType c,cpp,java,go,php,javascript,python,twig,xml,yml,html,vue.tsx,ts,jsx,typescript autocmd BufWritePre <buffer> if !exists('g:keep_trailing_whitespace') | call StripTrailingWhitespace() | endif
    autocmd FileType help no <buffer> q :bd<cr>
augroup end
