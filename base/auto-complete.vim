" For async completion
Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/echodoc.vim'

function! s:autoCompleteConfig()
    let g:deoplete#enable_at_startup = 1

	" echodoc not working correctly, do it myself
    "let g:echodoc#enable_at_startup = 1
    augroup autoComplete
        autocmd!
        autocmd CompleteDone,CursorMovedI * call s:on_complete_done()
		autocmd InsertLeave * call s:on_insert_leave()
    augroup END
endfunction

function! s:cmdlineComplete()
    " set ignore file extension of wildmenu, won't list when using filename completion
    set wildmenu
    set wildignore+=*.a,*.o,.DS_Store,.git,.hg,.svn,*~,*.swp,*.tmp,*/.sass-cache/*,*.scssc
    set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
    set shortmess+=c
endfunction

call s:autoCompleteConfig()
call s:cmdlineComplete()

function! s:on_complete_done() abort
    let item = get(v:, 'completed_item', {})
    if type(item) == 4
		echo get(item, 'menu', '')
    endif
endfunction

function! s:on_insert_leave() abort
	echo ''
endfunction
