function! NeomakeConfig()
    autocmd! BufWritePost * Neomake
    let g:neomake_open_list = 0
    let g:neomake_list_height = 5
    nmap <Leader>en :lnext<CR>      " next error/warning
    nmap <Leader>ep :lprev<CR>      " previous error/warning

    "let g:neomake_javascript_jshint_maker = {
                "\ 'args': ['--verbose', '--config=$XDG_DATA_HOME/nvim/.jshintrc'],
                "\ 'errorformat': '%A%f: line %l\, col %v\, %m \(%t%*\d\)',
                "\ }
    "let g:neomake_javascript_enabled_makers = ['jshint']
    let g:neomake_javascript_enabled_makers = ['eslint']

    function! NeomakeESlintChecker()
        "  configure b:syntastic_javascript_eslint_exec to point to the
        "  locally installed version of eslint if it exists otherwise fallback to the globally installed
        "  https://github.com/benekastah/neomake/issues/247#issuecomment-175808155
        " https://github.com/airbnb/javascript/issues/465#issuecomment-173281502
        let l:npm_bin = ''
        "let l:eslint = 'eslint'
        let l:eslint = 'eslint_d' " https://github.com/mantoni/eslint_d.js make eslint faster

        if executable('npm')
            let l:npm_bin = split(system('npm bin'), '\n')[0]
        endif

        if strlen(l:npm_bin) && executable(l:npm_bin . '/eslint_d')
            let l:eslint = l:npm_bin . '/eslint_d'
        endif

        let b:neomake_javascript_eslint_exe = l:eslint
endfunction
call NeomakeConfig()

function! DeopleteConfig()
    let g:deoplete#enable_at_startup = 1
endfunction
call DeopleteConfig()

function! CtrlpConfig()
    let g:ctrlp_working_path_mode = 'rw'
    "nnoremap <silent> <C-b> :CtrlPBuffer<CR>
    function! MapCr()
        if &buftype ==# "quickfix"
            execute "normal! \<CR>"
        else
            ":CtrlPMRUFiles<cr>
            :CtrlPBuffer
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
    call ctrlp_bdelete#init()
endfunction
"call CtrlpConfig()

function! s:find_root()
  for vcs in ['.git', '.svn', '.hg']
    let dir = finddir(vcs.'/..', ';')
    if !empty(dir)
      execute 'FZF' dir
      return
    endif
  endfor
  FZF
endfunction

command! FZFR call s:find_root()
function! FZFConfig()
    no <leader>pf :GitFiles<cr>
    no <leader>ff :FZFR<cr>
    no <leader><cr> :Buffer<cr>
endfunction
call FZFConfig()

" Unite
function! UniteConfig()
    " Set up some custom ignores
    call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep',
                \ 'ignore_pattern', join([
                \ '\.git/',
                \ 'node_modules/',
                \ ], '\|'))

    "if executable('ag')
        "let g:unite_source_rec_async_command= 'ag --follow --nocolor --nogroup --hidden -g ""'
        "let g:unite_source_grep_command = 'ag'
        "let g:unite_source_grep_default_opts = '--column --nogroup --nogroup'
        "let g:unite_source_grep_recursive_opt = ''
    "endif

    let g:unite_source_rec_max_cache_files = 99999

    let g:unite_source_history_yank_enable = 1
    call unite#filters#matcher_default#use(['matcher_fuzzy'])
    nnoremap <C-p> :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec/async:!<cr>
    nnoremap <C-i> :<C-u>Unite -no-split -buffer-name=files   -start-insert file<cr>
    "nnoremap <C-m> :<C-u>Unite -no-split -buffer-name=mru     -start-insert file_mru:!<cr>
    nnoremap <C-o> :<C-u>Unite -no-split -buffer-name=outline -start-insert outline<cr>
    nnoremap <C-h> :<C-u>Unite -no-split -buffer-name=yank    history/yank<cr>
    nnoremap <C-m> :<C-u>Unite -no-split -buffer-name=buffer  buffer<cr>
endfunction
"call UniteConfig()

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
"call NeoTermConfig()

function! AirlineConfig()
    let g:airline_theme='powerlineish'
    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif
    let g:airline_symbols.branch=''
    let g:airline#extensions#default#section_truncate_width = {
                \ 'a': 80,
                \ 'x': 80,
                \ 'y': 80,
                \ 'z': 80,
                \ }
    let g:airline#extensions#branch#enabled = 1

    let g:airline#extensions#tabline#enabled = 1
    " enable/disable displaying buffers with a single tab.
    let g:airline#extensions#tabline#show_buffers = 1
endfunction
call AirlineConfig()

function! FugittiveConfig()
  nmap <Leader>gs <Plug>GitGutterStageHunk
  nmap <Leader>gr <Plug>GitGutterRevertHunk
  nmap <Leader>gp <Plug>GitGutterPreviewHunk
  nmap <Leader>gn <Plug>GitGutterNextHunk
endfunction
call FugittiveConfig()
