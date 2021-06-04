" for debug
"source $XDG_DATA_HOME/nvim/init_minimal.vim

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

" Required
call plug#begin(expand('~/.config/nvim/plugged'))

source $XDG_DATA_HOME/nvim/base.vim
source $XDG_DATA_HOME/nvim/base/file-explorer.vim
source $XDG_DATA_HOME/nvim/base/appearance.vim
source $XDG_DATA_HOME/nvim/base/editorconfig.vim
source $XDG_DATA_HOME/nvim/base/more-powerful.vim

" coc-search can make this happen
" source $XDG_DATA_HOME/nvim/base/searchAndReplace.vim

source $XDG_DATA_HOME/nvim/base/terminal.vim
source $XDG_DATA_HOME/nvim/base/tags.vim
source $XDG_DATA_HOME/nvim/base/git.vim
source $XDG_DATA_HOME/nvim/base/test.vim
source $XDG_DATA_HOME/nvim/base/code-format.vim
"Asynchronous linting/fixing for Vim and Language Server Protocol (LSP) integration
source $XDG_DATA_HOME/nvim/base/ale.vim
" source $XDG_DATA_HOME/nvim/base/auto-complete.vim
" source $XDG_DATA_HOME/nvim/base/auto-complete-coc.vim
source $XDG_DATA_HOME/nvim/base/auto-complete-lsp.vim
" source $XDG_DATA_HOME/nvim/base/auto-complete-ncm2.vim
source $XDG_DATA_HOME/nvim/base/snippet.vim
"source $XDG_DATA_HOME/nvim/base/task.vim
source $XDG_DATA_HOME/nvim/base/layout.vim

source $XDG_DATA_HOME/nvim/langs/js.vim
source $XDG_DATA_HOME/nvim/langs/ts.vim
"source $XDG_DATA_HOME/nvim/langs/vue.vim
source $XDG_DATA_HOME/nvim/langs/go.vim
source $XDG_DATA_HOME/nvim/langs/yaml.vim
source $XDG_DATA_HOME/nvim/langs/markdown.vim
source $XDG_DATA_HOME/nvim/langs/clang.vim

source $XDG_DATA_HOME/nvim/base/keys.vim

" Add plugins to &runtimepath
call plug#end()

lua << EOF
local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>El', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '<space>Ep', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', '<space>En', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>Eq', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "<space>fm", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  elseif client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("n", "<space>fm", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
  end
end

-- Use a loop to conveniently both setup defined servers 
-- and map buffer local keybindings when the language server attaches
-- local servers = { "pyright", "rust_analyzer", "tsserver" }
local servers = { "tsserver" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach }
end
EOF

