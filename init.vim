if empty($XDG_DATA_HOME)
    let $XDG_DATA_HOME = $HOME . '/.config'
endif

let mapleader = "\<Space>"

source $XDG_DATA_HOME/nvim/helper.vim
source $XDG_DATA_HOME/nvim/setting.vim

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

"source $XDG_DATA_HOME/nvim/init_minimal.vim
source $XDG_DATA_HOME/nvim/base.vim
source $XDG_DATA_HOME/nvim/base/file-explorer.vim
source $XDG_DATA_HOME/nvim/base/appearance.vim
source $XDG_DATA_HOME/nvim/base/more-powerful.vim
source $XDG_DATA_HOME/nvim/base/searchAndReplace.vim
source $XDG_DATA_HOME/nvim/base/terminal.vim
source $XDG_DATA_HOME/nvim/base/tags.vim
source $XDG_DATA_HOME/nvim/base/git.vim
source $XDG_DATA_HOME/nvim/base/test.vim
" Asynchronous linting/fixing for Vim and Language Server Protocol (LSP) integration
"source $XDG_DATA_HOME/nvim/base/ale.vim
source $XDG_DATA_HOME/nvim/base/code-format.vim
"source $XDG_DATA_HOME/nvim/base/auto-complete.vim
source $XDG_DATA_HOME/nvim/base/snippet.vim
source $XDG_DATA_HOME/nvim/base/auto-complete-coc.vim
source $XDG_DATA_HOME/nvim/base/task.vim

source $XDG_DATA_HOME/nvim/langs/js.vim
source $XDG_DATA_HOME/nvim/langs/ts.vim
source $XDG_DATA_HOME/nvim/langs/vue.vim
source $XDG_DATA_HOME/nvim/langs/go.vim
source $XDG_DATA_HOME/nvim/langs/markdown.vim

source $XDG_DATA_HOME/nvim/base/keys.vim

" Add plugins to &runtimepath
call plug#end()
