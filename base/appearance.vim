" Theme
Plug 'flazz/vim-colorschemes'

function! AirlineConfig()
    "let g:airline_theme = 'powerlineish'
    let g:airline#extensions#syntastic#enabled = 0
    let g:airline#extensions#branch#enabled = 1
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tagbar#enabled = 0
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

    " reduce ariline space of each section
    let g:airline_mode_map = {
                \ '__' : '-',
                \ 'c'  : 'C',
                \ 'i'  : 'I',
                \ 'ic' : 'I',
                \ 'ix' : 'I',
                \ 'n'  : 'N',
                \ 'ni' : 'N',
                \ 'no' : 'N',
                \ 'R'  : 'R',
                \ 'Rv' : 'R',
                \ 's'  : 'S',
                \ 'S'  : 'S',
                \ '' : 'S',
                \ 't'  : 'T',
                \ 'v'  : 'V',
                \ 'V'  : 'V',
                \ '' : 'V',
                \ }
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

    call AirlineConfig()
endfunction
call s:enableAirline()

function! s:setup()
    " enable true color support on terminal
    set termguicolors
    set background=dark
    " color solarized8_dark
    color Monokai

    let g:airline_section_z = airline#section#create(['windowswap', 'obsession', 'linenr', '/%L', g:airline_symbols.space.'%c'])
    " integrate with coc.nvim
    " let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
    " let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'
endfunction

augroup appearance
    autocmd!
    autocmd VimEnter * call s:setup()
augroup END
