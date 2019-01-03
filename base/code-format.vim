Plug 'Chiel92/vim-autoformat'

function! s:autoFormatConfig()
    let g:formatdef_vue = '"html-beautify  --indent_scripts=keep --wrap-attributes=force --unformatted=[\"a\",\"abbr\",\"area\",\"audio\",\"b\",\"bdi\",\"bdo\",\"br\",\"button\",\"canvas\",\"cite\",\"code\",\"data\",\"datalist\",\"del\",\"dfn\",\"em\",\"embed\",\"i\",\"iframe\",\"img\",\"input\",\"ins\",\"kbd\",\"keygen\",\"label\",\"map\",\"mark\",\"math\",\"meter\",\"noscript\",\"object\",\"output\",\"progress\",\"q\",\"ruby\",\"s\",\"samp\",\"select\",\"small\",\"span\",\"strong\",\"sub\",\"sup\",\"svg\",\"textarea\",\"time\",\"u\",\"var\",\"video\",\"wbr\",\"text\",\"acronym\",\"address\",\"big\",\"dt\",\"ins\",\"small\",\"strike\",\"tt\",\"pre\",\"h1\",\"h2\",\"h3\",\"h4\",\"h5\",\"h6\"]"'
    let g:formatters_html = ['vue']

    "au BufWrite * :Autoformat
    command! FormatVue set ft=html | Autoformat | set ft=vue
endfunction

call s:autoFormatConfig()
