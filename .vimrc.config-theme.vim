" =============================================================================
" Theme settings
" =============================================================================

set t_Co=256
colorscheme vim-material
let ayucolor="dark"
let g:solarized_contrast='high'
let base16colorspace=256                    " Access colors present in 256 colorspace
" italic comment
highlight Comment cterm=italic gui=italic

if (has("termguicolors"))
  set termguicolors
endif
