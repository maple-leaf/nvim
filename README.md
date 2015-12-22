# nvim配置文件

##关于neovim的安装与配置
 - [installing neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim)

##关于neovim的配置
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
    * ctrlp.vim
    * ctrlp_bdelete.vim
    * vim-airline
    * VisIncr
    * vim-easy-align
    * ag.vim  //项目搜索
    * vim-session //项目管理
    * vim-colorschemes 
    * vim-misc
    * neomake  //语法检查
    * deoplete.nvim  //自动补全
    * IndexedSearch
    * ultisnips
    * vim-snippets
    * UltiSnips-ext  //本人自己的snippet
    * vim-template
    * my-vim-templates  //本人自己的template
    * matchit.zip
    * rename.vim
    * vim-surround
    * vim-node
    * vim-js-indent
    * vim-jsdoc
    * yajs.vim
    * vim-jsx
    * javascript-libraries-syntax.vim
    * tern_for_vim
    * vim-less
    * scss-syntax.vim
    * html5.vim
    * emmet-vim
