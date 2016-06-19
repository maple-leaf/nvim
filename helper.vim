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

function! Rsync()
    !rsync -azcuv --relative --delete-after --exclude ".sync" --exclude ".git" . hlg:/service/develop/fengye/zsadmin/view/
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
function! DeleteMatchingBuffers(pattern)
    let l:bufferList = filter(range(1, bufnr('$')), 'buflisted(v:val)')
    let l:matchingBuffers = filter(bufferList, 'bufname(v:val) =~ a:pattern')
    if len(l:matchingBuffers) < 1
        echo 'No buffers found matching pattern ' . a:pattern
        return
    endif
    exec 'bd ' . join(l:matchingBuffers, ' ')
endfunction

command! -nargs=1 BD call DeleteMatchingBuffers('<args>')

function! FormatJSON(...)
  let code="\"
        \ var i = process.stdin, d = '';
        \ i.resume();
        \ i.setEncoding('utf8');
        \ i.on('data', function(data) { d += data; });
        \ i.on('end', function() {
        \     console.log(JSON.stringify(JSON.parse(d), null, 
        \ " . (a:0 ? a:1 ? a:1 : 2 : 2) . "));
        \ });\""
  execute "%! node -e " . code 
endfunction
nmap ,fj :<C-U>call FormatJSON(v:count)<CR>
