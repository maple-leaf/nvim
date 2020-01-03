Plug 'w0rp/ale'

function! s:aleConfig()
    let g:ale_linters = {
                \   'javascript': ['eslint'],
                \   'typescript': ['tsserver', 'eslint'],
                \   'typescriptreact': ['tsserver', 'eslint'],
                \   'vue': ['prettier', 'eslint'],
                \   'elixir': ['mix'],
                \   'html': [],
                \   'json': ['prettier'],
                \}
    let g:ale_linter_aliases = {
                \ 'vue': ['html', 'javascript', 'css']
                \ }
    let g:ale_fixers = {
                \   'javascript': ['eslint'],
                \   'typescript': ['prettier', 'eslint'],
                \   'typescriptreact': ['eslint'],
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

    " Map movement through errors without wrapping.
    nmap <Leader>ep <Plug>(ale_previous)
    nmap <Leader>en <Plug>(ale_next)
    nmap <Leader>ef <Plug>(ale_fix)
endfunction
call s:aleConfig()
