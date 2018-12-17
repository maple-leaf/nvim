Plug 'blindFS/vim-taskwarrior'

function! s:taskConfig()
    no <leader>tw :TW<cr>
    no <leader>tu :TWUndo<cr>
endfunction

call s:taskConfig()
