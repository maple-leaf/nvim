Plug 'plasticboy/vim-markdown'
if MySys() == 'mac'
" live preview with auto mac window management
Plug 'junegunn/vim-xmark', { 'do': 'make' }
endif
" live preview with auto scroll
" use https://github.com/ashfinal/awesome-hammerspoon to manage window layout
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

function! s:markdownPreviewConfig()
    function! g:Open_browser(url)
        "silent exe 'silent !open -a \"Google Chrome" ' . a:url
        silent exe 'silent !open -b com.apple.Safari -n ' . a:url
        silent exe 'silent !open -g hammerspoon://previewMarkdown'
    endfunction
    let g:mkdp_browserfunc = 'g:Open_browser'
    let g:mkdp_page_title = '${name} markdown preview'
    function! s:Close_browser()
        :MarkdownPreviewStop
        silent exe 'silent !open -g hammerspoon://previewMarkdownStop'
    endfunction
    command! MarkdownPreviewS call s:Close_browser()
endfunction
call s:markdownPreviewConfig()

" generate title indexes of content
Plug 'mzlogin/vim-markdown-toc'

function! s:vimMarkdownTOCConfig()
    let g:vmt_fence_text = 'TOC'
    let g:vmt_fence_closing_text = '/TOC'
endfunction
call s:vimMarkdownTOCConfig()
