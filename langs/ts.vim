Plug 'mhartington/nvim-typescript', {'do': './install.sh'}

function! s:tsConfig()
    let g:nvim_typescript#javascript_support = 1
    let g:nvim_typescript#vue_support = 1
    augroup tsAuto
	autocmd!
	autocmd BufEnter *.js,*.ts,*.tsx,*.jsx,*.vue no gd :TSDef<cr>
    augroup END
endfunction
call s:tsConfig()
