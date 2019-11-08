Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" diagnostics
nnoremap <silent> <leader>ecl  :<C-u>CocList diagnostics<cr>
nmap <silent> <leader>ecn <Plug>(coc-diagnostic-next)
nmap <silent> <leader>ecp <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>ecf <Plug>(coc-fix-current)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>fm  <Plug>(coc-format-selected)
nmap <leader>fm  <Plug>(coc-format-selected)

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
vmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)

" Use `:Format` for format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` for fold current buffer
command! -nargs=? Fold :call CocAction('fold', <f-args>) | normal zR


" Using CocList
" Manage extensions
nnoremap <silent> ,e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> ,c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> ,o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> ,s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> ,n  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> ,p  :<C-u>CocPrev<CR>
" Resume latest coc list
"nnoremap <silent> ,p  :<C-u>CocListResume<CR>

augroup autoCompleteCoc
    autocmd!
    " Setup formatexpr specified filetype(s).
    "autocmd FileType typescript,javascript,json setl formatexpr=CocAction('formatSelected') | set fdm=manual
    " Update signature help on jump placeholder
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    " Auto update fold
    "autocmd BufWritePost *.js,*.html,*.ts Fold | zR
augroup end
