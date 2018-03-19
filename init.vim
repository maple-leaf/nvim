if empty($XDG_DATA_HOME)
	let $XDG_DATA_HOME = $HOME . '/.config'
endif
source  $XDG_DATA_HOME/nvim/helper.vim

let mapleader = "\<Space>"

" curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.config/nvim/plugged')

" add or remove your bundles here:
source $XDG_DATA_HOME/nvim/plugins.vim
source $XDG_DATA_HOME/nvim/auto-complete.vim
source $XDG_DATA_HOME/nvim/git.vim
source $XDG_DATA_HOME/nvim/project.vim
" source $XDG_DATA_HOME/nvim/nyao-config.vim

" Add plugins to &runtimepath
call plug#end()

filetype plugin indent on    " required

source $XDG_DATA_HOME/nvim/plugins-config.vim
source  $XDG_DATA_HOME/nvim/settings.vim
source  $XDG_DATA_HOME/nvim/keys.vim

