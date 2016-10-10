""""""""""""""""""""""""""""""""""""""""
" normal mapping
""""""""""""""""""""""""""""""""""""""""" 
" movement
" move current up <a-k>
no ˚ <PageUp>
" move current down <a-j>
no ∆ <PageDown>

function! MapTabCtrl()
    " move to next tab
    no <right> :tabnext<CR>
    " move to prev tab
    no <left> :tabprevious<CR>
    " move to tab 1-9 <a-1..9>
    no ¡ 1gt
    no ™ 2gt
    no £ 3gt
    no ¢ 4gt
    no ∞ 5gt
    no § 6gt
    no ¶ 7gt
    no • 8gt
    no ª 9gt
endfunction
call MapTabCtrl()

" cd to the directory containing the file in the buffer
nmap  <leader>cd :lcd %:h<cr>
cmap cwd lcd %:p:h
cmap cd. lcd %:p:h
" Find merge conflict markers
map <leader>fc /\v^[<\|=>]{7}( .*\|$)<CR>

" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" Allow using the repeat operator with a visual selection (!)
" http://stackoverflow.com/a/8064607/127816
vnoremap . :normal .<CR>

" get path of current file at cmd line
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" Make the directory that contains the file in the current buffer.
" This is useful when you edit a file in a directory that doesn't
" (yet) exist
" nmap  <leader>md :!mkdir name %:p:h

function! MapWindowCtrl()
    " Move the cursor to the window left of the current one
    noremap <silent> <leader>wh :wincmd h<cr>
    " Move the cursor to the window below the current one
    noremap <silent> <leader>wj :wincmd j<cr>
    " Move the cursor to the window above the current one
    noremap <silent> <leader>wk :wincmd k<cr>
    " Move the cursor to the window right of the current one
    noremap <silent> <leader>wl :wincmd l<cr>
    " Close the current window
    noremap <silent> <leader>wc :close<cr>
    " Maximum the current window
    noremap <silent> <leader>wo :only<cr>
    " balance all windows 
    noremap <silent> <leader>wb :wincmd <C-=><cr>
    " Move the current window to the right of the main Vim window
    noremap <silent> <leader>wL <C-W>L
    " Move the current window to the top of the main Vim window
    noremap <silent> <leader>wK <C-W>K
    " Move the current window to the left of the main Vim window
    noremap <silent> <leader>wH <C-W>H
    " Move the current window to the bottom of the main Vim window
    noremap <silent> <leader>wJ <C-W>J
    " Adjust viewports to the same size
    map <Leader>= <C-w>=
endfunction

call MapWindowCtrl()

" Easier horizontal scrolling
map zl zL
map zh zH

function! MapFoldCtrl()
    nmap <leader>f0 :set foldlevel=0<CR>
    nmap <leader>f1 :set foldlevel=1<CR>
    nmap <leader>f2 :set foldlevel=2<CR>
    nmap <leader>f3 :set foldlevel=3<CR>
    nmap <leader>f4 :set foldlevel=4<CR>
    nmap <leader>f5 :set foldlevel=5<CR>
    nmap <leader>f6 :set foldlevel=6<CR>
    nmap <leader>f7 :set foldlevel=7<CR>
    nmap <leader>f8 :set foldlevel=8<CR>
    nmap <leader>f9 :set foldlevel=9<CR>
endfunction
call MapFoldCtrl()

ino ;; <ESC>
vno ;; <ESC>
nno ;; <ESC>

" filename completion
ino <c-j> <c-x><c-f>
" display all lines with keyword under cursor
" and ask which one to jump to
nmap <Leader>sw [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

" some mappings for copying the file name to the clipboard. 
" Convert slashes to backslashes for Windows.
if has('win32')
    " only file name with extension
    nmap ;cs :let @*=substitute(expand("%"), "/", "\\", "g")<CR>
    " full path 
    nmap ;cl :let @*=substitute(expand("%:p"), "/", "\\", "g")<CR>

    " This will copy the path in 8.3 short format, for DOS and Windows 9x
    nmap ;c8 :let @*=substitute(expand("%:p:8"), "/", "\\", "g")<CR>
else
    nmap ;cs :let @*=expand("%")<CR>
    nmap ;cl :let @*=expand("%:p")<CR>
endif

imap ¬ <end>
no <F1> <Nop>
imap <F1> <Nop>
vmap <F1> <Nop>
nmap q: <Nop>     "avoid annoying cmdline window

" write as root!
cmap w!! w !sudo tee > /dev/null %

no <Leader><tab> :b#<cr>

" netrw
no <Leader>e :Lexplore<cr>
