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
endfunction
"call NeomakeConfig()

function! AleConfig()
    " why disable elixir linter: https://github.com/phoenixframework/phoenix/issues/1165
    let g:ale_linters = {
                \   'javascript': ['eslint'],
                \   'elixir': [],
                \   'html': [],
                \}
    let g:ale_lint_delay = 800
    " Map movement through errors without wrapping.
    nmap <Leader>ep <Plug>(ale_previous)
    nmap <Leader>en <Plug>(ale_next)
    nmap <Leader>ef <Plug>(ale_fix)
    let g:ale_fixers = {
                \   'javascript': [
                \       'eslint'
                \   ],
                \   'vue': [
                \       'eslint'
                \   ]
                \}
endfunction
call AleConfig()

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
                \ 'dir':  '\.git$\\.hg$\\.svn$\\.sass-cache$',
                \ 'file': '\.exe$\\.so$\\.dll$\\.pyc$\\.scssc$' }
    let g:ctrlp_mruf_relative = 1   " only MRU files in the current working directory

    " On Windows use 'dir' as fallback command.
    if has('win32')  has('win64')
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

function! FZFConfig()
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
    no <leader>oo :BTags<cr>
    no <leader>og :Tags<cr>
endfunction
call FZFConfig()

" Unite
function! UniteConfig()
    " Set up some custom ignores
    call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep',
                \ 'ignore_pattern', join([
                \ '\.git/',
                \ 'node_modules/',
                \ ], '\'))

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

command! -nargs=0 -bar Qargs execute 'args ' . s:quickfixFilenames()
function! s:quickfixFilenames()
  " Building a hash ensures we get each buffer only once
  let buffer_numbers = {}
  for quickfix_item in getqflist()
    let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
  endfor
  return join(values(buffer_numbers))
endfunction

function! s:ag_at_project_root(keyword, replaceStr)
    Qargs
    execute "argdo %s/" . a:keyword . "/" . a:replaceStr . "/g"
endfunction
command! -nargs=* GRep call s:ag_at_project_root(<f-args>)

function! VimGrepperConfig()
    let g:grepper               = {}
    let g:grepper.tools         = ['git', 'ag', 'rg']
    let g:grepper.jump          = 1
    let g:grepper.next_tool     = '<tab>'
    let g:grepper.simple_prompt = 1
    let g:grepper.quickfix      = 1
    let g:grepper.dir = 'repo,file'
    no <Leader>/ :GrepperAg 
endfunction
call VimGrepperConfig()

function! VimTernConfig()
    let g:tern#arguments = ["--no-port-file"]
    no <Leader>tD   :TernDoc<cr>
    no <Leader>tb   :TernDocBrowse<cr>
    no <Leader>tt   :TernType<cr>
    no <Leader>td   :TernDef<cr>
    no <Leader>tpd  :TernDefPreview<cr>
    no <Leader>tsd  :TernDefSplit<cr>
    no <Leader>ttd  :TernDefTab<cr>
    no <Leader>tr   :TernRefs<cr>
    no <Leader>tR   :TernRename<cr>
endfunction
call VimTernConfig()

function! s:tagbarConfig()
    let g:tagbar_ctags_bin='jsctags'
endfunction

function! s:genTagsConfig()
    g:gen_tags#ctags_auto_gen = 1
endfunction

function! s:easyMotionConfig()
    let g:EasyMotion_do_mapping = 0 " Disable default mappings

    " Jump to anywhere you want with minimal keystrokes, with just one key binding.
    " `s{char}{label}`
    nmap s <Plug>(easymotion-overwin-f)
    " or
    " `s{char}{char}{label}`
    " Need one more keystroke, but on average, it may be more comfortable.
    nmap s <Plug>(easymotion-overwin-f2)

    " Turn on case insensitive feature
    let g:EasyMotion_smartcase = 1

    " JK motions: Line motions
    map <Leader>j <Plug>(easymotion-j)
    map <Leader>k <Plug>(easymotion-k)
endfunction
call s:easyMotionConfig()

" You can use other keymappings like <C-l> instead of <CR> if you want to
" use these mappings as default search and somtimes want to move cursor with
" EasyMotion.
function! s:incsearch_easymotion_intergration(...) abort
    return incsearch#util#deepextend(deepcopy({
                \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
                \   'keymap': {
                \     "\<CR>": '<Over>(easymotion)'
                \   },
                \   'is_expr': 0
                \ }), get(a:, 1, {}))
endfunction
function! s:incsearch_easymotion_intergration_with_fuzzy(...) abort
    return extend(copy({
                \   'converters': [incsearch#config#fuzzyword#converter()],
                \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
                \   'keymap': {"\<CR>": '<Over>(easymotion)'},
                \   'is_expr': 0
                \ }), get(a:, 1, {}))
endfunction

function! s:incsearchConfig()
    noremap <silent><expr> /  incsearch#go(<SID>incsearch_easymotion_intergration())
    noremap <silent><expr> ?  incsearch#go(<SID>incsearch_easymotion_intergration({'command': '?'}))
    noremap <silent><expr> g/  incsearch#go(<SID>incsearch_easymotion_intergration_with_fuzzy())
    noremap <silent><expr> g?  incsearch#go(<SID>incsearch_easymotion_intergration_with_fuzzy({'command': '?'}))
endfunction
call s:incsearchConfig()

function! s:vueConfig()
    " https://github.com/posva/vim-vue#vim-gets-slows-down-when-using-this-plugin-how-can-i-fix-that
    let g:vue_disable_pre_processors = 1
    " NERDCommenter hook for vue
    let g:ft = ''
    function! NERDCommenter_before()
        if &ft == 'vue'
            let g:ft = 'vue'
            let stack = synstack(line('.'), col('.'))
            if len(stack) > 0
                let syn = synIDattr((stack)[0], 'name')
                if len(syn) > 0
                    exe 'setf ' . substitute(tolower(syn), '^vue_', '', '')
                endif
            endif
        endif
    endfunction
    function! NERDCommenter_after()
        if g:ft == 'vue'
            setf vue
            let g:ft = ''
        endif
    endfunction
endfunction
call s:vueConfig()

function! s:swoopConfig()
    nmap <Leader>sw :call Swoop()<CR>
    vmap <Leader>sw :call SwoopSelection()<CR>
    nmap <Leader>sm :call SwoopMulti()<CR>
    vmap <Leader>sm :call SwoopMultiSelection()<CR>
    let g:swoopPatternSpaceInsertsWildcard = 0
    autocmd!    BufWinLeave   swoopBuf   call execute('bd! swoopBuf')
endfunction
call s:swoopConfig()
