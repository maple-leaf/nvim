" vue support
Plug 'posva/vim-vue'

function! s:vueConfig()
	" performance issue
    let g:vue_disable_pre_processors=1
    augroup vueAuto
	autocmd!
	" performance issue: https://github.com/posva/vim-vue/issues/95#issuecomment-374108025
    "autocmd BufEnter *.vue set norelativenumber | set number

    autocmd CursorHold,CursorHoldI *.vue FixSyntax
    augroup END
endfunction

call s:vueConfig()

