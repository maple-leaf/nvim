""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 Git Tools                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'jreybert/vimagit'

""""""""""""
"  Config  "
""""""""""""

function! s:fugittiveConfig()
    nmap <Leader>gs <Plug>GitGutterStageHunk
    nmap <Leader>gr <Plug>GitGutterRevertHunk
    nmap <Leader>gp <Plug>GitGutterPrevHunk
    nmap <Leader>gn <Plug>GitGutterNextHunk
endfunction
call s:fugittiveConfig()

function! s:vimgitConfig()
    let g:magit_discard_untracked_do_delete = 1
endfunction
call s:vimgitConfig()

function! s:magitConfig()
    nno <Leader>ma :MagitOnly<cr>
endfunction
call s:magitConfig()

" custom git operation

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
