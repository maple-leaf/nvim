function! s:getchar() abort
	redraw | echo 'Press any key: '
	let c = getchar()
	while c ==# "\<CursorHold>"
		redraw | echo 'Press any key: '
		let c = getchar()
	endwhile
	redraw | echomsg printf('Raw: "%s" | Char: "%s"', c, nr2char(c))
endfunction
command! GetChar call s:getchar()

command! Reload :source $XDG_DATA_HOME/nvim/init.vim

command! FixSyntax :syntax sync fromstart " sometimes vim can't highlight syntax correctly
