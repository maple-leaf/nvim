if empty($XDG_DATA_HOME)
    let $XDG_DATA_HOME = $HOME . '/.config'
endif

let mapleader = "\<Space>"

function! s:checkPlug()
	let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')

	if !filereadable(vimplug_exists)
	  if !executable("curl")
	    echoerr "You have to install curl or first install vim-plug yourself!"
	    execute "q!"
	  endif
	  echo "Installing Vim-Plug..."
	  echo ""
	  silent !\curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	  let g:not_finish_vimplug = "yes"

	  autocmd VimEnter * PlugInstall
	endif
endfunction

call s:checkPlug()

" Required:
call plug#begin(expand('~/.config/nvim/plugged'))

Plug 'HerringtonDarkholme/yats.vim'
Plug 'cohama/lexima.vim'

call plug#end()
