Plug 'flazz/vim-colorschemes'
Plug 'junegunn/vim-easy-align'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch.vim' " improved search, fuzzy search, search index and count
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'

" Group dependencies, vim-snippets depends on ultisnips
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets' | Plug 'maple-leaf/UltiSnips-ext'
"Plug 'benekastah/neomake'
Plug 'w0rp/ale'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'danro/rename.vim'
" Produce increasing/decreasing columns of numbers, dates, or daynames
Plug 'iiey/visincr'
" grep tool
Plug 'mhinz/vim-grepper'

Plug 'tpope/vim-surround'
Plug 'aperezdc/vim-template'
Plug 'maple-leaf/my-vim-templates'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdcommenter'
"Plug 'kassio/neoterm'

Plug 'tpope/vim-repeat'
Plug 'pelodelfuego/vim-swoop'

" generate tags
" better ctags: http://docs.ctags.io/en/latest/
Plug 'ludovicchabant/vim-gutentags'
"Plug 'majutsushi/tagbar'
"Plug 'jsfaint/gen_tags.vim'

Plug 'Konfekt/FastFold'

" format code
Plug 'sbdchd/neoformat'

" Langs support
Plug 'fatih/vim-go'
Plug 'jodosha/vim-godebug'

Plug 'elixir-lang/vim-elixir'
Plug 'thinca/vim-ref'
Plug 'awetzel/elixir.nvim', { 'do': 'yes \| ./install.sh' }

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
    " vue support
    Plug 'posva/vim-vue'
    " XML/HTML tags navigation
    Plug 'tmhedberg/matchit'

    " JS syntax, supports ES6
    Plug 'othree/yajs.vim', {
                \   'for': ['javascript']
                \ }
    " Typescript support
    Plug 'HerringtonDarkholme/yats.vim'
    Plug 'clausreinke/typescript-tools.vim', { 'do': 'npm install' }
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
    Plug 'trotzig/import-js', {
                \ 'for': ['javascript']
                \}
endfunction
call FrontEndSupport()
