""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 Git Tools                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'jreybert/vimagit'
Plug 'rhysd/git-messenger.vim'

""""""""""""
"  Config  "
""""""""""""

function! s:fugittiveConfig()
    nmap <Leader>gs <Plug>(GitGutterStageHunk)
    nmap <Leader>gr <Plug>(GitGutterUndoHunk)
    nmap <Leader>gp <Plug>(GitGutterPrevHunk)
    nmap <Leader>gn <Plug>(GitGutterNextHunk)
    nmap <Leader>gv <Plug>(GitGutterPreviewHunk)
endfunction
call s:fugittiveConfig()

function! ShowMagit()
    let s:status = execute("!git status -sb")
    if s:status =~ "package-lock.json"
        " dont show diff when has large diffs to prevent vim freeze
        " use zo to view diff
        let g:magit_default_show_all_files=0
    else
        let g:magit_default_show_all_files=1
    endif
    MagitOnly
endfunction

function! s:magitConfig()
    let g:magit_discard_untracked_do_delete = 1
    let g:magit_commit_title_limit=100
    " autocmd User VimagitEnterCommit bd! | T 'git-cz'
    nno <Leader>ma :call ShowMagit()<cr>
endfunction
call s:magitConfig()

function! s:gitMessagerConfig()
    let g:git_messenger_no_default_mappings = v:true
    let g:git_messenger_into_popup_after_show = v:true
    nmap <leader>gl <Plug>(git-messenger)
endfunction
call s:gitMessagerConfig()


""""""""""""""""""""""""""
"  custom git operation  "
""""""""""""""""""""""""""

" git branch
function! s:open_branch_fzf(line)
    let l:parser = split(a:line)
    let l:branch = l:parser[0]
    if l:branch ==? '*'
        let l:branch = l:parser[1]
    endif
    execute '!git checkout ' . l:branch . ' && git pull'
endfunction

command! -bang -nargs=0 GBranch
            \ call fzf#vim#grep(
            \   'git branch', 0,
            \   {
            \     'sink': function('s:open_branch_fzf')
            \   },
            \   <bang>0
            \ )

no <leader>gb :GBranch<cr>

" git merge
function! s:merge_branch_fzf(line)
    let l:parser = split(a:line)
    let l:branch = l:parser[0]
    if l:branch ==? '*'
        let l:branch = l:parser[1]
    endif
    execute '!git merge ' . l:branch
endfunction

command! -bang -nargs=0 GMerge
            \ call fzf#vim#grep(
            \   'git branch', 0,
            \   {
            \     'sink': function('s:open_branch_fzf')
            \   },
            \   <bang>0
            \ )

no <leader>gm :GMerge<cr>
