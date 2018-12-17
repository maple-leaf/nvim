Plug 'kassio/neoterm'
Plug 'BurningEther/nvimux'

function! s:neoTermConfig()
    let g:neoterm_automap_keys = ',tt'

    let g:neoterm_keep_term_open = 0
    let g:neoterm_default_mod = 'vertical'
endfunction

function! s:nvimuxConfig()
    let g:nvimux_quickterm_provider = 'neoterm#new'
    no <Leader>' :NvimuxToggleTerm<cr>
endfunction

call s:neoTermConfig()
call s:nvimuxConfig()
