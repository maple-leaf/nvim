Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}

function! s:tsConfig()
    let g:nvim_typescript#javascript_support = 1
    let g:nvim_typescript#vue_support = 1
    let g:nvim_typescript#diagnostics_enable = 0
    augroup tsAuto
	autocmd!
	autocmd BufEnter *.js,*.ts,*.tsx,*.jsx,*.vue call s:tsKeys()
    augroup END
endfunction
call s:tsConfig()

function! s:tsKeys()
    no gd :TSDef<cr>
    no gh :TSType<cr>
endfunction
