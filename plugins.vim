"Plug 'flazz/vim-colorschemes'
Plug 'icymind/NeoSolarized'

Plug 'junegunn/vim-easy-align'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch.vim' " improved search, fuzzy search, search index and count
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'brooth/far.vim' " search and replace

Plug 'w0rp/ale'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
set rtp+=~/.fzf_browser/vim " file manager

Plug 'danro/rename.vim'
" Produce increasing/decreasing columns of numbers, dates, or daynames
Plug 'iiey/visincr'

Plug 'tpope/vim-surround'
Plug 'aperezdc/vim-template'
Plug 'maple-leaf/my-vim-templates'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdcommenter'
Plug 'kassio/neoterm'
Plug 'BurningEther/nvimux'

Plug 'tpope/vim-repeat'
Plug 'sgur/vim-editorconfig'
" XML/HTML tags navigation
Plug 'andymass/vim-matchup'
" Plug 'jiangmiao/auto-pairs'

" generate tags
" better ctags: http://docs.ctags.io/en/latest/
Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'

Plug 'Konfekt/FastFold'

" Displays function signatures from completions in the command line
Plug 'Shougo/echodoc.vim'

" format code
" Plug 'sbdchd/neoformat'

" Langs support
Plug 'fatih/vim-go'
Plug 'jodosha/vim-godebug'

Plug 'elixir-lang/vim-elixir'
Plug 'thinca/vim-ref'
Plug 'awetzel/elixir.nvim', { 'do': 'yes \| ./install.sh' }

function! FrontEndSupport()
    Plug 'heavenshell/vim-jsdoc'
    " write html ease
    " Plug 'mattn/emmet-vim'
    Plug 'othree/html5.vim'
    " less syntax
    Plug 'groenewege/vim-less'
    " scss syntax
    Plug 'cakebaker/scss-syntax.vim'
    " react jsx support
    Plug 'chemzqm/vim-jsx-improve'
    " vue support
    Plug 'posva/vim-vue', { 'branch': 'performance-enhancement' }

    " JS syntax, supports ES6
    " may make vim-vue slow https://github.com/posva/vim-vue/issues/95#issuecomment-374108025
    " Plug 'othree/yajs.vim', {
                " \   'for': ['javascript']
                " \ }
    " Plug 'flowtype/vim-flow', { 'for': ['javascript', 'vue'] }

    " Typescript support
    Plug 'HerringtonDarkholme/yats.vim'
    Plug 'mhartington/nvim-typescript', { 'do': './install.sh' }

    " Better indentation
    Plug 'gavocanov/vim-js-indent', {
                \   'for': ['javascript', 'vue']
                \ }
    " JS syntax for common libraries
    Plug 'othree/javascript-libraries-syntax.vim', {
                \   'for': ['javascript', 'vue']
                \ }
    " Makes gf work on node require statements
    Plug 'moll/vim-node', {
                \   'for': ['javascript', 'vue']
                \ }
    Plug 'trotzig/import-js', {
                \ 'for': ['javascript', 'vue']
                \}
    Plug 'neovim/node-host'

    Plug 'retorillo/istanbul.vim'

    " Wrapper on top of mdn-cli for nvim.
    " Provides a :Mdn <search terms> command to query http://mdn.io,
    " parse the HTML result and fill in a vertical buffer with MDN documentation
endfunction
call FrontEndSupport()
