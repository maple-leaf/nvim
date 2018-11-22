" vue support
Plug 'posva/vim-vue'

function! s:vueConfig()
    augroup vueAuto
	autocmd!
	" performance issue: https://github.com/posva/vim-vue/issues/95#issuecomment-374108025
	autocmd BufEnter *.vue set norelativenumber | set number
    augroup END
endfunction

call s:vueConfig()

