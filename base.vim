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
    noremap ;ss :SSave 
    noremap ;sl :SLoad  
    noremap ;sc :SClose<cr>
endfunction
call s:startifyConfig()
