" Theme
Plug 'flazz/vim-colorschemes'

" Files
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

function! s:fzfConfig()
    function! s:find_root()
	for vcs in ['.git', '.svn', '.hg']
	    let dir = finddir(vcs.'/..', ';')
	    if !empty(dir)
		return dir
	    endif
	endfor
    endfunction
    function! s:open_project_files()
	let root = s:find_root()
	if !empty(root)
	    execute 'FZF' root
	el
	    echo 'FZF'
	    FZF
	endif
    endfunction

    command! FZFR call s:open_project_files()
    no <leader>pf :GitFiles<cr>
    "no <leader>ff :FZFR<cr>
    no <leader>ff :FZF<cr>
    no <leader><cr> :Buffer<cr>
endfunction

" For async completion
Plug 'Shougo/deoplete.nvim'

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

function! s:setupTheme()
    set background=dark
    color solarized
endfunction


function! s:baseSetup()
    call s:setupTheme()
    call s:fzfConfig()
    call s:deniteConfig()
endfunction
autocmd! VimEnter * call s:baseSetup()
