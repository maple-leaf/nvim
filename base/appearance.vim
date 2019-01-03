" Theme
Plug 'flazz/vim-colorschemes'

function! s:setupTheme()
    " enable true color support on terminal
    set termguicolors
    set background=light
    color solarized8_light
endfunction


function! s:airlineConfig()
    let g:airline_theme = 'powerlineish'
    let g:airline#extensions#syntastic#enabled = 1
    let g:airline#extensions#branch#enabled = 1
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tagbar#enabled = 1
    let g:airline#extensions#gutentags#enabled = 1
    let g:airline_skip_empty_sections = 1

    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif

    if !exists('g:airline_powerline_fonts')
        let g:airline#extensions#tabline#left_sep = ' '
        let g:airline#extensions#tabline#left_alt_sep = '|'
        let g:airline_left_sep          = '▶'
        let g:airline_left_alt_sep      = '»'
        let g:airline_right_sep         = '◀'
        let g:airline_right_alt_sep     = '«'
        let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
        let g:airline#extensions#readonly#symbol   = '⊘'
        let g:airline#extensions#linecolumn#prefix = '¶'
        let g:airline#extensions#paste#symbol      = 'ρ'
        let g:airline_symbols.linenr    = '␊'
        let g:airline_symbols.branch    = '⎇'
        let g:airline_symbols.paste     = 'ρ'
        let g:airline_symbols.paste     = 'Þ'
        let g:airline_symbols.paste     = '∥'
        let g:airline_symbols.whitespace = 'Ξ'
    else
        let g:airline#extensions#tabline#left_sep = ''
        let g:airline#extensions#tabline#left_alt_sep = ''

        " powerline symbols
        let g:airline_left_sep = ''
        let g:airline_left_alt_sep = ''
        let g:airline_right_sep = ''
        let g:airline_right_alt_sep = ''
        let g:airline_symbols.branch = ''
        let g:airline_symbols.readonly = ''
        let g:airline_symbols.linenr = ''
    endif

    " tabline 
    " enable/disable displaying buffers with a single tab.
    let g:airline#extensions#tabline#show_buffers = 1
    let g:airline#extensions#tabline#fnamemod = ':p:.'
    let g:airline#extensions#tabline#fnamecollapse = 0

    let g:airline#extensions#default#section_truncate_width = {
                \ 'a': 80,
                \ 'x': 80,
                \ 'y': 80,
                \ 'z': 80,
                \ }
endfunction

" airline will cause performance issue
function! s:enableAirline()
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    call s:airlineConfig()
endfunction

augroup appearance
    autocmd!
    autocmd VimEnter * call s:setupTheme()
augroup END
