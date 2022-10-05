" Start screen and session manager
Plug 'mhinz/vim-startify'
" Comment
Plug 'scrooloose/nerdcommenter'

function! s:commentConfig()
    " Add spaces after comment delimiters by default
    let g:NERDSpaceDelims = 1

    " Use compact syntax for prettified multi-line comments
    let g:NERDCompactSexyComs = 1

    " Allow commenting and inverting empty lines (useful when commenting a region)
    let g:NERDCommentEmptyLines = 1

    " Enable trimming of trailing whitespace when uncommenting
    let g:NERDTrimTrailingWhitespace = 1

    " Enable NERDCommenterToggle to check all selected lines is commented or not 
    let g:NERDToggleCheckAllLines = 1
endfunction
call s:commentConfig()

function! s:startifyConfig()
    let g:startify_change_to_dir = 0
    let g:startify_change_to_vcs_root = 0

    noremap ;ss :SSave 
    noremap ;sl :SLoad  
    noremap ;sc :SClose<cr>
endfunction
call s:startifyConfig()

" the time treesitter is installed by the :PlugUpdate command of Vim-Plug the :TSUpdate command is not yet available
" Restart and run TSUpdate command manually
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}


" lua helper function
Plug 'nvim-lua/plenary.nvim'
