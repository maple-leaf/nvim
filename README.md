# nvim配置文件

## 关于neovim的安装
 - [installing neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim)

## 关于neovim的配置
 - 配置文件位置使基于 `$XDG_DATA_HOME` 这个shell环境变量，默认是在 `~/.config/`。下面是我相关的 `.zshrc`

    ```
    # variable required by neovim
    export XDG_DATA_HOME="$HOME/.config"
    ```

 - 接下来可以执行clone该repo到 `.config` 目录下

   `git clone https://github.com/maple-leaf/nvim.git ~/.config/nvim`

 - 安装插件管理器[vim-plug](https://github.com/junegunn/vim-plug#user-content-installation)

    ```
    curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    ```

 - 从terminal中启动`nvim`, 然后输入 `:PlugInstall`, 将安装以下插件(共30个,均可在github中搜索到):
    - ale //语法检查
    - vim-session //项目管理
    - phpcomplete.vim
    - my-vim-templates //本人自己的template
    - deoplete-go
    - fzf // 项目文件查找, 最近打开的文件，已打开的文件
    - import-js
    - neco-vim
    - deoplete.nvim //自动补全
    - deoplete-ternjs
    - deoplete-typescript
    - vim-snippets
    - vim-grepper
    - javascript-libraries-syntax.vim
    - yats.vim
    - vim-javacomplete2
    - vim-go
    - elixir.nvim
    - vim-colorschemes
    - vim-less
    - FastFold
    - vim-fugitive
    - incsearch-fuzzy.vim
    - vim-jsdoc
    - vim-easy-align
    - scss-syntax.vim
    - vim-repeat
    - vim-misc
    - vim-easymotion
    - vim-template
    - yajs.vim
    - vim-airline-themes
    - vimagit
    - vim-gitgutter
    - nerdcommenter
    - vim-ref
    - incsearch.vim
    - vim-godebug
    - vim-airline
    - typescript-tools.vim
    - rename.vim
    - vim-js-indent
    - incsearch-easymotion.vim
    - ultisnips
    - html5.vim
    - fzf.vim
    - UltiSnips-ext //本人自己的snippet
    - vim-jsx
    - nyaovim-popup-tooltip
    - vim-elixir
    - vim-node
    - emmet-vim
    - vim-surround
    - vim-vue

- 安装python依赖
    * 由于`UltiSnips` 和 `deoplete` 依赖python，所以需要安装`python3`: `brew install python3`。然后运行pip3安装`neovim`: `pip3 install neovim`
    * `nvim-completion-manager`依赖安装：`pip3 install --user neovim jedi mistune psutil setproctitle`

- 开始你的`neovim`编码世界吧
