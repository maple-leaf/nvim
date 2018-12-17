" JS syntax, supports ES6
Plug 'othree/yajs.vim', {
            \   'for': ['javascript', 'vue']
            \ }
Plug 'Quramy/vim-js-pretty-template'
Plug 'jason0x43/vim-js-indent'
Plug 'heavenshell/vim-jsdoc'

function! s:jsDocConfig()
    let g:jsdoc_input_descritions = 1
    let g:jsdoc_allow_input_prompt = 1
    let g:jsdoc_access_descriptions = 2
    let g:jsdoc_underscore_private = 1
    let g:jsdoc_param_description_separator = ' - '
    let g:jsdoc_enable_es6 = 1

    no <c-d> <esc>:JsDoc<cr>
    ino <c-d> <esc>:JsDoc<cr>
endfunction
call s:jsDocConfig()
