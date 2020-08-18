Plug 'w0rp/ale'

function! s:aleConfig()
    let g:ale_linters = {
                \   'javascript': ['prettier', 'eslint'],
                \   'typescript': ['prettier', 'tsserver', 'eslint'],
                \   'typescriptreact': ['prettier', 'tsserver', 'eslint'],
                \   'vue': ['prettier', 'eslint'],
                \   'elixir': ['mix'],
                \   'html': [],
                \   'json': ['prettier'],
                \}
    let g:ale_linter_aliases = {
                \ 'vue': ['html', 'javascript', 'css']
                \ }
    let g:ale_fixers = {
                \   'javascript': ['prettier', 'eslint'],
                \   'typescript': ['prettier', 'eslint'],
                \   'typescriptreact': ['prettier', 'eslint'],
                \   'vue': [
                \       'eslint',
                \   ],
                \   'html': [
                \   ],
                \   'json': ['prettier']
                \}
    " if filereadable('.vim-disable-prettier')
        " let g:ale_linters['javascript'] = ['eslint']
        " let g:ale_fixers['javascript'] = ['eslint']
    " endif

    let g:ale_lint_delay = 200
    let g:ale_fix_on_save = 1
    let g:ale_open_list = 0 " show errors list when has
    " If you use Prettier config files, you must set g:ale_javascript_prettier_use_local_config to have ALE respect them:
    let g:ale_javascript_prettier_use_local_config = 1
    " --parser parse5 -> support html format
    " let g:ale_javascript_prettier_options = "--parser parse5 --print-width 120 --ignore-path ~/dotfiles/.prettierignore"
    let g:ale_exclude_highlights = []

    " Map movement through errors without wrapping.
    nmap <Leader>ep <Plug>(ale_previous)
    nmap <Leader>en <Plug>(ale_next)
    nmap <Leader>ef <Plug>(ale_fix)
    nmap gd <Plug>(ale_go_to_definition)
    nmap gr <Plug>(ale_find_references)
    nmap gh <Plug>(ale_hover)
endfunction
call s:aleConfig()
