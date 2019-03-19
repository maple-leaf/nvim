Plug 'ludovicchabant/vim-gutentags', {'do': 'plug#helptags()'}
Plug 'majutsushi/tagbar'
Plug 'liuchengxu/vista.vim'

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

function! s:vistaConfig()
    " Position to open the vista sidebar. On the right by default.
    " Change to 'vertical topleft' to open on the left.
    let g:vista_sidebar_position = 'vertical botright'

    " Width of vista sidebar.
    let g:vista_sidebar_width = 30

    " Set this flag to 0 to disable echoing when the cursor moves.
    let g:vista_echo_cursor = 1

    " Time delay for showing detailed symbol info at current cursor.
    let g:vista_cursor_delay = 400

    " Close the vista window automatically close when you jump to a symbol.
    let g:vista_close_on_jump = 0

    " Move to the vista window when it is opened.
    let g:vista_stay_on_open = 1

    " Blinking cursor 2 times with 100ms interval after jumping to the tag.
    let g:vista_blink = [2, 100]

    " How each level is indented and what to prepend.
    " This could make the display more compact or more spacious.
    " e.g., more compact: ["▸ ", ""]
    let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]

    " Executive used when opening vista sidebar without specifying it.
    " Avaliable: 'coc', 'ctags'. 'ctags' by default.
    let g:vista_default_executive = 'ctags'

    " Declare the command including the executable and options used to generate ctags output
    " for some certain filetypes.The file path will be appened to your custom command.
    " For example:
    let g:vista_ctags_cmd = {
                \ 'haskell': 'hasktags -o - -c',
                \ }

    " To enable fzf's preview window set g:vista_fzf_preview.
    " The elements of g:vista_fzf_preview will be passed as arguments to fzf#vim#with_preview()
    " For example:
    let g:vista_fzf_preview = ['right:50%']

    " Fall back to other executives if the specified one gives empty data.
    " By default it's all the provided executives excluding the tried one.
    " let g:vista_finder_alternative_executives = ['coc']
endfunction
