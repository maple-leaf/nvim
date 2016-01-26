Plug 'flazz/vim-colorschemes'
Plug 'junegunn/vim-easy-align'

" Group dependencies, vim-snippets depends on ultisnips
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets' | Plug 'maple-leaf/UltiSnips-ext'
Plug 'benekastah/neomake'
" if encounter `failed to load python host`, see https://github.com/Shougo/deoplete.nvim/issues/31
Plug 'Shougo/deoplete.nvim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'd11wtq/ctrlp_bdelete.vim'
"Plug 'scrooloose/nerdtree'
" vim sessions
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
Plug 'danro/rename.vim'
" Search results counter
Plug 'IndexedSearch'
Plug 'IndexedSearch'
" Produce increasing/decreasing columns of numbers, dates, or daynames
Plug 'VisIncr'
" grep tool
Plug 'rking/ag.vim'
Plug 'tpope/vim-surround'
Plug 'aperezdc/vim-template'
Plug 'maple-leaf/my-vim-templates'
Plug 'bling/vim-airline'
Plug 'scrooloose/nerdcommenter'
Plug 'kassio/neoterm'

function! FrontEndSupport()
    Plug 'heavenshell/vim-jsdoc'
    " write html ease
    Plug 'mattn/emmet-vim'
    Plug 'othree/html5.vim'
    " less syntax
    Plug 'groenewege/vim-less'
    " scss syntax
    Plug 'cakebaker/scss-syntax.vim'
    " react jsx support
    Plug 'mxw/vim-jsx'
    " XML/HTML tags navigation
    Plug 'matchit.zip'

    " JS syntax, supports ES6
    Plug 'othree/yajs.vim', {
                \   'for': ['javascript']
                \ }
    " Better indentation
    Plug 'gavocanov/vim-js-indent', {
                \   'for': ['javascript']
                \ }
    " JS syntax for common libraries
    Plug 'othree/javascript-libraries-syntax.vim', {
                \   'for': ['javascript']
                \ }
    " Tern auto-completion engine for JS (requires node/npm)
    if executable('node')
        Plug 'marijnh/tern_for_vim', {
                    \     'do': 'npm install',
                    \     'for': ['javascript', 'coffee']
                    \   }
    endif
    " Makes gf work on node require statements
    Plug 'moll/vim-node', {
                \   'for': ['javascript']
                \ }
    " vue component syntax
    Plug 'posva/vim-vue'
endfunction
call FrontEndSupport()
