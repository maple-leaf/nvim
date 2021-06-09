Plug 'voldikss/vim-floaterm'

function! s:floatermConfig() abort
    let g:floaterm_keymap_new = '<Leader>tc'
    let g:floaterm_keymap_prev = '<Leader>tp'
    let g:floaterm_keymap_next = '<Leader>tn'
    let g:floaterm_keymap_hide = '<Leader>th'
    let g:floaterm_keymap_show = '<Leader>ts'
    let g:floaterm_keymap_kill = '<Leader>tk'
    let g:floaterm_keymap_toggle = '<Leader>tt'

    nnoremap <leader>tb :FloatermToggle bulidTerm<cr>
    nnoremap <leader>tg :FloatermToggle GitTerm<cr>

    autocmd User Startified setlocal buflisted
endfunction

call s:floatermConfig()

tnoremap <C-l> <C-\><C-n>:call ClearTerminal()<cr>

function! ClearTerminal()
    echo 'Neovim terminal have bug on clearing terminal'
endfunction
