Plug 'voldikss/vim-floaterm'

function! s:toggleOrCreateTerm(bang, name) abort
    if a:bang
        call floaterm#toggle(a:bang, a:name)
    endif
    if !empty(a:name)
        let bufnr = floaterm#terminal#get_bufnr(a:name)
        if bufnr == -1
            execute('FloatermNew --name='.a:name)
        else
            call floaterm#toggle(a:bang, a:name)
        endif
    else
        call floaterm#util#show_msg('Name is empty')
    endif
endfunction

command! -nargs=? -bang -complete=customlist,floaterm#cmdline#floaterm_names
                          \ FloatermToggleOrCreate call s:toggleOrCreateTerm(<bang>0, <q-args>)

function! s:floatermConfig() abort
    let g:floaterm_keymap_new = '<Leader>tc'
    let g:floaterm_keymap_prev = '<Leader>tp'
    let g:floaterm_keymap_next = '<Leader>tn'
    let g:floaterm_keymap_hide = '<Leader>th'
    let g:floaterm_keymap_show = '<Leader>ts'
    let g:floaterm_keymap_kill = '<Leader>tk'
    let g:floaterm_keymap_toggle = '<Leader>tt'

    nnoremap <leader>tb :FloatermToggleOrCreate bulidTerm<cr>

    autocmd User Startified setlocal buflisted
endfunction

call s:floatermConfig()
