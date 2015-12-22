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
