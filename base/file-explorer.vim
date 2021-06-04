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
    no <leader>/ :Rg <C-R><C-W>
    no <leader>s :SearchCWord<cr>
endfunction

" File Explorer
Plug 'kevinhwang91/rnvimr'

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
    call s:rangerConfig()
endfunction

augroup file-explorer
    autocmd!
    autocmd VimEnter * call s:setup()
augroup end
