Plug 'ludovicchabant/vim-gutentags', {'do': 'plug#helptags()'}
Plug 'majutsushi/tagbar'

function! s:guntenttagsConfig()
    " respect common ignore provided by ag
    let g:gutentags_file_list_command = 'ag -l'
endfunction

call s:guntenttagsConfig()

function! s:tagbarConfig()
    let g:tagbar_type_typescript = {                                                  
        \ 'ctagsbin' : 'ctags',
		\ 'ctagsargs' : '-f-',
		\ 'kinds': [
		\ 'e:enums:0:1',
		\ 'f:function:0:1',
		\ 't:typealias:0:1',
		\ 'M:Module:0:1',
		\ 'I:import:0:1',
		\ 'i:interface:0:1',
		\ 'C:class:0:1',
		\ 'm:method:0:1',
		\ 'p:property:0:1',
		\ 'v:variable:0:1',
		\ 'c:const:0:1',
		\ ],
		\ 'sort' : 0
		\ } 
endfunction

call s:tagbarConfig()
