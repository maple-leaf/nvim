"turn on that syntax highlighting
syntax on

" make buffer files can hidden
set hidden
" don't update the display while executing macros
set lazyredraw

" show what mode i'm in
set showmode

set cul " highlight current line
highlight clear SignColumn      " SignColumn should match background for
" things like vim-gitgutter, vim-signify

highlight clear LineNr          " Current line number row will have same background color in relative mode.

set nohls " dont highlight search keyword

set autoindent                  " Indent at the same level of the previous line
set shiftwidth=4                " Use indents of 4 spaces
set expandtab                   " Tabs are spaces, not tabs
set tabstop=4                   " An indentation every four columns
set softtabstop=4               " Let backspace delete indent

set fdm=syntax                  " set fold method

set relativenumber

" language and encoding stuff
set helplang="en,zh-cn"
set fileencodings=utf-8,chinese,latin-1
set fileformat=unix

set ignorecase    " Case insensitive search
set smartcase     " Case sensitive when uc present
" set ignore file extension of wildmenu, won't list when using filename completion
set wildmenu
set wildignore+=*.a,*.o,.DS_Store,.git,.hg,.svn,*~,*.swp,*.tmp,*/.sass-cache/*,*.scssc
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too

set scrolljump=5                " Lines to scroll when cursor leaves screen
set scrolloff=3                 " Minimum lines to keep above and below cursor

set foldenable                  " Auto fold code
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace

" detect which style of file
let g:C_Styles = { '*.c,*.h' : 'C', '*.cc,*.cpp,*.hh' : 'CPP' }

" colorscheme
set background=dark
color solarized

set guifont=Bitstream_Vera_Sans_Mono:h18

set laststatus=2

function! CustomStatusLine()
  " set stl=%f\ %m\ %r\ Line:\ %l/%L[%p%%]\ Col:\ %c\ Buf:\ #%n\ [%b][0x%B]
  " Broken down into easily includeable segments
  set statusline=%<%f\                     " Filename
  set statusline+=%w%h%m%r                 " Options
  "set statusline+=%{fugitive#statusline()} " Git Hotness
  set statusline+=\ [%{&ff}/%Y]            " Filetype
  set statusline+=\ [%{getcwd()}]          " Current dir
  set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endfunction

" prevent '<esc>' delay in terminal http://stackoverflow.com/a/33957679/2326199
set ttimeout
set ttimeoutlen=100

" netrw
let g:netrw_liststyle=3
let g:netrw_winsize=30

" paste mode
:map <F10> :set paste<CR>
:map <F9> :set nopaste<CR>
:imap <F10> <C-O>:set paste<CR>
:imap <F9> <nop>
:set pastetoggle=<F9>

augroup MyAutoCommands
    " Clear old autocmds in group
    autocmd!

    " File types
    autocmd BufRead,BufNewFile *.haml setfiletype haml
    autocmd BufRead,BufNewFile config.ru,Gemfile,Isolate setfiletype ruby
    autocmd BufRead,BufNewFile *.liquid,*.mustache setfiletype liquid
    autocmd BufNewFile,BufRead *.coffee set filetype=coffee
    autocmd BufNewFile,BufRead *.html.twig set filetype=html.twig
    autocmd BufNewFile,BufRead *.hbs,*.phtml set filetype=html

    " Ruby files
    autocmd FileType ruby,eruby, imap <buffer> <CR> <C-R>=RubyEndToken()<CR>

    autocmd FileType ruby, haml nnoremap <Leader>d orequire "ruby-debug"; debugger; ""<Esc>
    autocmd FileType ruby, haml nnoremap <Leader>D Orequire "ruby-debug"; debugger; ""<Esc>

    " Auto-wrap text in all buffers
    " autocmd BufRead,BufNewFile * set formatoptions+=t
    " silent the warning sound
    autocmd GUIEnter * set visualbell t_vb=
    " colorcolumn=80
    au FileType python setl cc=80
    " Remove trailing whitespaces and ^M chars
    autocmd FileType c,cpp,java,go,php,javascript,python,twig,xml,yml,html autocmd BufWritePre <buffer> if !exists('g:keep_trailing_whitespace') | call StripTrailingWhitespace() | endif
    autocmd FileType go autocmd BufWritePre <buffer> Fmt
    autocmd FileType html,xml,xhtml,css,sass,scss,less set fdm=indent | set fdl=3

    " disable scratch preview window when select completion
    set completeopt-=preview
augroup END

" reload nvim config
command! Reload :source ~/.config/nvim/init.vim

" terminal
tnoremap <Esc> <C-\><C-n>

command! Rsync :!rsync -azcuv --relative --delete-after --exclude ".sync" --exclude ".git" . hlg:/service/develop/fengye/zsadmin/view/
