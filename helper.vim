" return OS type 
function! MySys()
    if has("win16")||has("win32")||has("dos")||has("dos16")||has("dos32")||has("win64")||has("win95")
        return "windows"
    elseif has("unix")
        return has('mac') ? "mac" : "linux"
    endif
endfunction

" check required folders needed by this vimrc , if not exists,create
function! EnsureDirExists (dir)
    if !isdirectory(a:dir)
        if exists("*mkdir")
            call mkdir(a:dir,'p')
            echo "Created directory: " . a:dir
        else
            echo "Please create directory: " . a:dir
            !cmd
        endif
    endif
endfunction

" Strip whitespace
function! StripTrailingWhitespace()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " do the business:
    %s/\s\+$//e
    " clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

"===============================================================================
" Author: JarrodCTaylor
" Source: https://github.com/JarrodCTaylor/dotfiles/blob/master/vim/functions/delete-regex-buffers.vim
" DESCRIPTION:   Delete buffers from buffer list matching regex
" EXAMPLE USAGE: Assuming we have [text1.md, text2.md, text3.md] buffers open.
"                We can delete buffers text2.md and text3.md like so
"                `:BD 2\|3`
"                There are delete because the regex `2\|3` matches the desired
"                buffer names
"===============================================================================
function! DeleteMatchingBuffers(pattern, hasBang)
    let l:bufferList = filter(range(1, bufnr('$')), 'buflisted(v:val)')
    let l:matchingBuffers = filter(bufferList, 'bufname(v:val) =~ a:pattern')
    if len(l:matchingBuffers) < 1
        echo 'No buffers found matching pattern ' . a:pattern
        return
    endif
    if (a:hasBang)
        execute 'bd! ' . join(l:matchingBuffers, ' ')
    else
        execute 'bd ' . join(l:matchingBuffers, ' ')
    endif
endfunction

command! -nargs=1 -bang BD call DeleteMatchingBuffers('<args>', <bang>0)

" 新开tab显示命令执行的结果
" Examples:
" TabMessage highlight
" TabMessage !git stash show -p stash@{0}
function! TabMessage(cmd)
  redir => message
  silent execute a:cmd
  redir END
  tabnew
  silent put=message
  set nomodified
endfunction
command! -nargs=+ -complete=command TabMessage call TabMessage(<q-args>)

" Maximize window and return to previous split structure
function! MaximizeToggle()
  if exists("s:maximize_session")
    exec "source " . s:maximize_session
    call delete(s:maximize_session)
    unlet s:maximize_session
    let &hidden=s:maximize_hidden_save
    unlet s:maximize_hidden_save
  else
    let s:maximize_hidden_save = &hidden
    let s:maximize_session = tempname()
    set hidden
    exec "mksession! " . s:maximize_session
    only
  endif
endfunction
