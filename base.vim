" Tagbar
Plug 'majutsushi/tagbar'

function! s:tagbarConfig()
    let g:tagbar_type_typescript = {
		\ 'ctagstype': 'typescript',
		\ 'kinds': [
		\ 'c:classes',
		\ 'n:modules',
		\ 'f:functions',
		\ 'v:variables',
		\ 'v:varlambdas',
		\ 'm:members',
		\ 'i:interfaces',
		\ 'e:enums',
		\ ]
		\ }
endfunction

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


function! s:baseSetup()
    call s:tagbarConfig()
    call s:fzfConfig()
    call s:deniteConfig()
endfunction
augroup baseConfig
    autocmd!
    autocmd VimEnter * call s:baseSetup()
augroup END
