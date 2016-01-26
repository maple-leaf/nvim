function! NeomakeConfig()
    autocmd! BufWritePost * Neomake
    let g:neomake_open_list = 0
    let g:neomake_list_height = 5
    nmap <Leader><Space>n :lnext<CR>      " next error/warning
    nmap <Leader><Space>p :lprev<CR>      " previous error/warning

    let g:neomake_javascript_jshint_maker = {
                \ 'args': ['--verbose', '--config=$XDG_DATA_HOME/nvim/.jshintrc'],
                \ 'errorformat': '%A%f: line %l\, col %v\, %m \(%t%*\d\)',
                \ }
    let g:neomake_javascript_enabled_makers = ['jshint']
endfunction
call NeomakeConfig()

" Use deoplete.
let g:deoplete#enable_at_startup = 1

function! CtrlpConfig()
    let g:ctrlp_working_path_mode = 'rw'
    nnoremap <silent> <C-b> :CtrlPBuffer<CR>
    function! MapCr()
        if &buftype ==# "quickfix"
            execute "normal! \<CR>"
        else
            :CtrlPMRUFiles<cr>
        endif
    endfunction
    nnoremap <silent> <C-m> :call MapCr()<cr>
    let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:50'
    let g:ctrlp_use_caching = 1
    let g:ctrlp_clear_cache_on_exit = 0
    let g:ctrlp_show_hidden = 0
    let g:ctrlp_custom_ignore = {
                \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.sass-cache$',
                \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$\|\.scssc$' }
    let g:ctrlp_mruf_relative = 1   " only MRU files in the current working directory

    " On Windows use 'dir' as fallback command.
    if has('win32') || has('win64')
        let g:ctrlp_user_command = {
                    \ 'types': {
                    \ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
                    \ 2: ['.hg', 'hg --cwd %s locate -I .'],
                    \ },
                    \ 'fallback': 'dir %s /-n /b /s /a-d'
                    \ }
    else
        let g:ctrlp_user_command = {
                    \ 'types': {
                    \ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
                    \ 2: ['.hg', 'hg --cwd %s locate -I .'],
                    \ },
                    \ 'fallback': 'find %s -type f'
                    \ }
    endif
endfunction
call CtrlpConfig()
call ctrlp_bdelete#init()

" Session
function! SessionConfig()
    call EnsureDirExists($XDG_DATA_HOME . '/nvim/sessions/')
    set sessionoptions-=help
    let g:session_directory = $XDG_DATA_HOME . '/nvim/sessions/'
    let g:session_autosave = 'yes'
    let g:session_autoload = 'no'
    let g:session_default_name = "last"
    no ms :SaveSession 
    no \s :OpenSession 
endfunction
call SessionConfig()

function! UltiSnipsConfig()
    let g:UltiSnipsExpandTrigger = '<c-k>'
    let g:UltiSnipsJumpForwardTrigger = '<c-k>'
    let g:UltiSnipsJumpBackwardTrigger = '<c-i>'
    let g:UltiSnipsEditSplit = 'horizontal'
    if isdirectory($XDG_DATA_HOME . '/nvim/plugged/UltiSnips-ext')
        let g:UltiSnipsSnippetsDir = $XDG_DATA_HOME . '/nvim/plugged/UltiSnips-ext/UltiSnips/'
    endif
endfunction
call UltiSnipsConfig()

" vim-easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

function! NeoTermConfig()
    let g:neoterm_position = 'horizontal'
    let g:neoterm_automap_keys = ',tt'

    nnoremap <silent> <f10> :TREPLSendFile<cr>
    nnoremap <silent> <f9> :TREPLSend<cr>
    vnoremap <silent> <f9> :TREPLSend<cr>

    " run set test lib
    nnoremap <silent> ,rt :call neoterm#test#run('all')<cr>
    nnoremap <silent> ,rf :call neoterm#test#run('file')<cr>
    nnoremap <silent> ,rn :call neoterm#test#run('current')<cr>
    nnoremap <silent> ,rr :call neoterm#test#rerun()<cr>

    " Useful maps
    " hide/close terminal
    nnoremap <silent> ,th :call neoterm#close()<cr>
    " clear terminal
    nnoremap <silent> ,tl :call neoterm#clear()<cr>
    " kills the current job (send a <c-c>)
    nnoremap <silent> ,tc :call neoterm#kill()<cr>

    " Git commands
    command! -nargs=+ Tg :T git <args>
endfunction
call NeoTermConfig()
