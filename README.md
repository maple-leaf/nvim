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
    - my-vim-templates //本人自己的template
    - fzf // 项目文件查找, 最近打开的文件，已打开的文件
    - UltiSnips-ext //本人自己的snippet
    - matchit
    - vim-repeat
    - ncm-flow
    - neco-vim
    - vim-snippets
    - javascript-libraries-syntax.vim
    - incsearch-fuzzy.vim
    - vim-jsdoc
    - vim-easy-align
    - tern_for_vim
    - scss-syntax.vim
    - visincr
    - csscomplete.vim
    - vim-grepper
    - vim-template
    - yajs.vim
    - vim-airline-themes
    - vim-go
    - vim-colorschemes
    - vim-js-indent
    - vim-gitgutter
    - vim-gutentags
    - incsearch.vim
    - vim-airline
    - typescript-tools.vim
    - import-js
    - yats.vim
    - elixir.nvim
    - vim-less
    - nvim-completion-manager
    - ultisnips
    - vim-fugitive
    - rename.vim
    - vim-misc
    - nvim-cm-tern
    - incsearch-easymotion.vim
    - vim-easymotion
    - FastFold
    - html5.vim
    - vim-jsx
    - nyaovim-popup-tooltip
    - vim-elixir
    - vim-node
    - vim-ref
    - vim-godebug
    - emmet-vim
    - vim-surround
    - vim-vue
    - nerdcommenter
    - vimagit

- 安装python依赖
    * 由于`UltiSnips` 和 `deoplete` 依赖python，所以需要安装`python3`: `brew install python3`。然后运行pip3安装`neovim`: `pip3 install neovim`
    * `nvim-completion-manager`依赖安装：`pip3 install --user neovim jedi mistune psutil setproctitle`

- Tags
    * ctags工具

        推荐使用[universal-ctags](https://github.com/universal-ctags/ctags),这个版本一直在维护更新，对很多语言的支持更好。mac用户可以brew安装，查看[homebrew-universal-ctags](https://github.com/universal-ctags/homebrew-universal-ctags)

    * 查看生成的tag列表
        - 查看当前文件的tags: <Space>oo
        - 查看项目所有文件<没有被ctags ignored>的tags: <Space>og

- Git
    * 使用`vimagit`进行代码更改查看，添加，提交操作
        - `<Space>ma`进入`vimagit`
        - `<Ctrl+n>`, `<Ctrl>+p`跳转到下/上一个更改片段
        - `S`<大写> 添加或者取消添加所处片段或文件或__选择__的行
        - `CC` 填写提交信息
        - 填写完后再次 `CC` 确认提交
        - 其他具体操作可按`?`显示帮助菜单，再按一次`?`隐藏

- 开始你的`neovim`编码世界吧
