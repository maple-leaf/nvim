Plug 'paroxayte/vwm.vim'


"""""""""""""
"  Layouts  "
"""""""""""""

let s:defaultLayout = {
      \  'name': 'default',
      \  'set_all': ['nonu', 'nornu'],
      \  'right':
      \  {
      \    'v_sz': 60,
      \    'init': ['term zsh'],
      \    'bot':
      \    {
      \      'init': ['term zsh']
      \    }
      \  }
      \}

let s:termLayout = {
      \  'name': 'term',
      \  'set_all': ['nonu', 'nornu'],
      \  'right':
      \  {
      \    'v_sz': 120,
      \    'init': ['term zsh'],
      \    'focus': 1
      \  }
      \}

function! s:vwmConfig()
    no <leader>vt :VwmToggle term<cr>
    no <leader>vd :VwmToggle default<cr>


    let g:vwm#layouts = [s:defaultLayout, s:termLayout]
endfunction

call s:vwmConfig()
