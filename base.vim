" Comment
Plug 'scrooloose/nerdcommenter'

function! s:comentConfig()
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

let g:deoplete#enable_at_startup = 1

" For Denite features
Plug 'Shougo/denite.nvim'
"Plug 'dunstontc/projectile.nvim'

" Enable deoplete at startup
function! s:deniteConfig()
    call denite#custom#map(
		\ 'insert',
		\ '<Down>',
		\ '<denite:move_to_next_line>',
		\ 'noremap'
		\)
    call denite#custom#map(
		\ 'insert',
		\ '<Up>',
		\ '<denite:move_to_previous_line>',
		\ 'noremap'
		\)

    call denite#custom#var('file/rec', 'command',
		\ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])

    "no <leader>pp :Denite projectile<cr>
    "no <leader>pf :Denite file/rec<cr>
endfunction

function! s:baseSetup()
    call s:deniteConfig()
endfunction
augroup baseConfig
    autocmd!
    autocmd VimEnter * call s:baseSetup()
augroup END
