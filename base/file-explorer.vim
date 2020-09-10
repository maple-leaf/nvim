" Files
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

function! s:fzfConfig()
    " CTRL-F CTRL-Q to select all and build quickfix list
    function! s:build_quickfix_list(lines)
        call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
        copen
        cc
    endfunction

    function! s:jump_to_buffer_line(lines)
        copen
        echo a:lines
    endfunction

    let g:fzf_action = {
                \ 'ctrl-l': function('s:jump_to_buffer_line'),
                \ 'ctrl-q': function('s:build_quickfix_list'),
                \ 'ctrl-t': 'tab split',
                \ 'ctrl-x': 'split',
                \ 'ctrl-v': 'vsplit' }

    " for solarized light
    " https://github.com/junegunn/fzf/wiki/Color-schemes#solarized-light
    let s:fzf_color_dark = ['--color', 'dark,hl:33,hl+:37,fg+:235,bg+:136,fg+:254', '--color', 'info:254,prompt:37,spinner:108,pointer:235,marker:235']
    let s:fzf_color_light = ['--color', 'fg:166,bg:110,hl:33,fg+:241,bg+:221,hl+:33', '--color', 'info:33,prompt:33,pointer:166,marker:166,spinner:33']

    let s:fzf_preview_defaults = fzf#vim#with_preview()
    "let s:fzf_preview_options = s:fzf_color_light . ' --preview "' . $XDG_DATA_HOME . '/nvim/fzf-preview.sh {}" --preview-window right:50'
    "let s:fzf_preview_options = s:fzf_color_nord + s:fzf_preview_defaults['options'] + ['--delimiter=:', '--nth=4..']
    let s:fzf_preview_options = s:fzf_color_dark

    " use f instead of a to avoid conflict with move cursor to beginning
    let $FZF_DEFAULT_OPTS = '--bind ctrl-f:toggle-all'

    " use raw ag, should provide pattern when use
    " Augmenting Ag command using fzf#vim#with_preview function
    "   * fzf#vim#with_preview([[options], preview window, [toggle keys...]])
    "     * For syntax-highlighting, Ruby and any of the following tools are required:
    "       - Highlight: http://www.andre-simon.de/doku/highlight/en/highlight.php
    "       - CodeRay: http://coderay.rubychan.de/
    "       - Rouge: https://github.com/jneen/rouge
    "
    "   :RAg  - Start fzf with preview window at right
    "   :RAg! - Start fzf in fullscreen and display the preview window above
    "command! -bang -nargs=* Rag
                "\ call fzf#vim#ag_raw(<q-args>, 
                "\                 <bang>0 ? fzf#vim#with_preview('up:60%')
                "\                         : fzf#vim#with_preview('right:50%', '', '--color fg:-1,bg:-1,hl:33'),
                "\                 <bang>0)
    " escaped string with double quote and backslash -> :Rag "\(\'text\'\)"
    command! -bang -nargs=* Rag
                \ call fzf#vim#ag_raw(<q-args>, {'options': s:fzf_preview_options})

    function! s:blines_with_cword()
        " let g:word = execute('echo ')
        call fzf#vim#buffer_lines(expand("<cword>"))
    endfunction
    command! SearchCWord call s:blines_with_cword()

    function! FzfTagsCurrentWord()
        let l:word = expand('<cword>')
        let l:list = taglist(l:word)
        if len(l:list) == 1
            execute ':tag ' . l:word
        else
            call fzf#vim#tags("'".l:word)
        endif
    endfunction

    noremap <c-]> :call FzfTagsCurrentWord()<cr>

    function! s:openGitFilesAndPrintHelp()
        execute 'GitFiles --cached --others --exclude-standard'
        let helpMessage = "'exact-match ^prefix-exact-match suffix-exact-match$ !inverse-exact-match !^inverse-prefix-exact-match !inverse-suffix-exact-match$"
        echo helpMessage
    endfunction
    command! OpenGitFilesAndPrintHelp call s:openGitFilesAndPrintHelp()

    no <leader>pf :OpenGitFilesAndPrintHelp<cr>
    no <leader>ff :FZF<cr>
    no <leader><cr> :Buffer<cr>
    no <leader>oo :BTags<cr>
    no <leader>og :Tags<cr>
    " give cword as default argument for Rag
    no <leader>/ :Rag <C-R><C-W>
    no <leader>s :SearchCWord<cr>
endfunction

" File Explorer
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'vifm/vifm.vim'
Plug 'kevinhwang91/rnvimr'

function! s:defxConfig()
    no <leader>ee :Defx -split=vertical -winwidth=50 -direction=topleft<cr>
    no <leader>ec :Defx `expand('%:p:h')` -search=`expand('%:p') -split=vertical -winwidth=50 -direction=topleft<cr>
endfunction

function! s:defx_key_mapping() abort
    " Define mappings
    nnoremap <silent><buffer><expr> <CR>
                \ defx#is_directory() ? defx#do_action('open') :
                \ defx#do_action('multi', ['drop', 'quit'])
    nnoremap <silent><buffer><expr> c
                \ defx#do_action('copy')
    nnoremap <silent><buffer><expr> m
                \ defx#do_action('move')
    nnoremap <silent><buffer><expr> p
                \ defx#do_action('paste')
    nnoremap <silent><buffer><expr> l
                \ defx#is_directory() ? defx#do_action('open') :
                \ defx#do_action('multi', ['drop', 'quit'])
    nnoremap <silent><buffer><expr> E
                \ defx#do_action('open', 'vsplit')
    nnoremap <silent><buffer><expr> P
                \ defx#do_action('open', 'pedit')
    nnoremap <silent><buffer><expr> K
                \ defx#do_action('new_directory')
    nnoremap <silent><buffer><expr> N
                \ defx#do_action('new_file')
    nnoremap <silent><buffer><expr> d
                \ defx#do_action('remove')
    nnoremap <silent><buffer><expr> r
                \ defx#do_action('rename')
    nnoremap <silent><buffer><expr> !
                \ defx#do_action('execute_command')
    nnoremap <silent><buffer><expr> x
                \ defx#do_action('execute_system')
    nnoremap <silent><buffer><expr> yy
                \ defx#do_action('yank_path')
    nnoremap <silent><buffer><expr> .
                \ defx#do_action('toggle_ignored_files')
    nnoremap <silent><buffer><expr> ;
                \ defx#do_action('repeat')
    nnoremap <silent><buffer><expr> h
                \ defx#do_action('cd', ['..'])
    nnoremap <silent><buffer><expr> ~
                \ defx#do_action('cd')
    nnoremap <silent><buffer><expr> q
                \ defx#do_action('quit')
    nnoremap <silent><buffer><expr> <Space>
                \ defx#do_action('toggle_select') . 'j'
    nnoremap <silent><buffer><expr> *
                \ defx#do_action('toggle_select_all')
    nnoremap <silent><buffer><expr> j
                \ line('.') == line('$') ? 'gg' : 'j'
    nnoremap <silent><buffer><expr> k
                \ line('.') == 1 ? 'G' : 'k'
    nnoremap <silent><buffer><expr> <C-l>
                \ defx#do_action('redraw')
    nnoremap <silent><buffer><expr> <C-g>
                \ defx#do_action('print')
    nnoremap <silent><buffer><expr> cd
                \ defx#do_action('change_vim_cwd')
endfunction

function! s:cocExplorerConfig()
    no <leader>ee :CocCommand explorer --preset floating<cr>
endfunction

function! s:rangerConfig()
    " Make Ranger replace Netrw and be the file explorer
    let g:rnvimr_enable_ex = 1

    " Make Ranger to be hidden after picking a file
    let g:rnvimr_enable_picker = 1

    " Disable a border for floating window
    let g:rnvimr_draw_border = 0

    " Hide the files included in gitignore
    let g:rnvimr_hide_gitignore = 0

    " Make Neovim wipe the buffers corresponding to the files deleted by Ranger
    let g:rnvimr_enable_bw = 1

    " Link CursorLine into RnvimrNormal highlight in the Floating window
    highlight link RnvimrNormal CursorLine

    no <leader>ee :RnvimrToggle<cr>
endfunction

function! s:setup()
    call s:fzfConfig()
    " call s:cocExplorerConfig()
    " call s:defxConfig()
    call s:rangerConfig()
endfunction

augroup file-explorer
    autocmd!
    " autocmd FileType defx call s:defx_key_mapping()
    autocmd VimEnter * call s:setup()
augroup end
