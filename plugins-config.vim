function! s:fZFConfig()
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

    " use f instead of a to avoid conflict with move cursor to beginning
    let $FZF_DEFAULT_OPTS = '--bind ctrl-f:select-all'

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
    command! -bang -nargs=* Rag
                \ call fzf#vim#ag_raw(<q-args>,
                \                 <bang>0 ? fzf#vim#with_preview('up:60%')
                \                         : fzf#vim#with_preview('right:50%'),
                \                 <bang>0)

    function! s:blines_with_cword()
        " let g:word = execute('echo ')
        call fzf#vim#buffer_lines(expand("<cword>"))
    endfunction
    command! SearchCWord call s:blines_with_cword()

    no <leader>pf :GitFiles --cached --others --exclude-standard<cr>
    no <leader>ff :FZF<cr>
    no <leader><cr> :Buffer<cr>
    no <leader>oo :BTags<cr>
    no <leader>og :Tags<cr>
    " give cword as default argument for Rag
    no <leader>/ :Rag <C-R><C-W>
    no <leader>s :SearchCWord<cr>
endfunction
call s:fZFConfig()

function! NERDCommentConfig()
    let g:NERDSpaceDelims = 1
endfunction
call NERDCommentConfig()

function! AleConfig()
    let g:ale_linters = {
                \   'javascript': ['prettier', 'eslint'],
                \   'typescript': ['prettier', 'tslint'],
                \   'vue': ['prettier', 'eslint'],
                \   'elixir': ['mix'],
                \   'html': [],
                \   'json': ['prettier'],
                \}
    let g:ale_linter_aliases = {
                \ 'vue': ['html', 'javascript', 'css']
                \ }
    let g:ale_fixers = {
                \   'javascript': [
                \       'prettier',
                \       'eslint'
                \   ],
                \   'typescript': ['prettier', 'tslint'],
                \   'vue': [
                \       'prettier',
                \       'eslint'
                \   ],
                \   'html': [
                \   ],
                \   'json': ['prettier'],
                \}
    if filereadable('.vim-ale-js-disable-prettier')
        let g:ale_linters['javascript'] = ['eslint']
        let g:ale_fixers['javascript'] = ['eslint']
    endif

    let g:ale_lint_delay = 800
    let g:ale_fix_on_save = 1
    let g:ale_open_list = 0 " show errors list when has
    " If you use Prettier config files, you must set g:ale_javascript_prettier_use_local_config to have ALE respect them:
    let g:ale_javascript_prettier_use_local_config = 1
    let g:ale_javascript_prettier_options = "--trailing-comma es5"

    " Map movement through errors without wrapping.
    nmap <Leader>ep <Plug>(ale_previous)
    nmap <Leader>en <Plug>(ale_next)
    nmap <Leader>ef <Plug>(ale_fix)
endfunction
call AleConfig()

" vim-easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

function! NeoTermConfig()
    let g:neoterm_automap_keys = ',tt'

    let g:neoterm_keep_term_open = 0
    let g:neoterm_default_mod = 'vertical'
endfunction
call NeoTermConfig()

function! s:nvimuxConfig()
    let g:nvimux_quickterm_provider = 'neoterm#new'
    no <Leader>' :NvimuxToggleTerm<cr>
endfunction
call s:nvimuxConfig()

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
    let g:airline#extensions#tabline#fnamemod = ':p:.'
    let g:airline#extensions#tabline#fnamecollapse = 0
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

function! s:do_replace_on_quicklist(keyword, replaceStr)
    execute "cdo %s/" . a:keyword . "/" . a:replaceStr . "/g"
endfunction
command! -nargs=* GRep call s:do_replace_on_quicklist(<f-args>)

function! VimTSCConfig()
    let g:nvim_typescript#javascript_support=1
    let g:nvim_typescript#vue_support=1
    let g:nvim_typescript#type_info_on_hold=1
    autocmd BufNewFile,BufRead *.tsx set filetype=typescript

    no <Leader>tD   :TSDoc<cr>
    no <Leader>tt   :TSType<cr>
    no <Leader>ttd   :TSTypeDef<cr>
    no <Leader>td   :mark 1<cr>:TSDef<cr>
    no <Leader>tpd  :TSDefPreview<cr>
    no <Leader>tr   :TSRefs<cr>
    no <Leader>tR   :TSRename<cr>
endfunction
call VimTSCConfig()

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

function! s:neoformatConfig()
    autocmd BufWritePre *.js,*.vue,*.jsx,.ts,.tsx Neoformat prettier
endfunction
" call s:neoformatConfig()

function! s:matchupConfig()
    let g:matchup_matchparen_deferred = 1
    augroup matchup_matchparen_highlight
        autocmd!
        autocmd ColorScheme * hi MatchParen ctermbg=blue ctermfg=blue guibg=#0e022f guifg=#56a1ec cterm=italic gui=italic
    augroup END
endfunction
call s:matchupConfig()
