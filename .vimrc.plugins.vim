" =============================================================================
" Plugins
" =============================================================================

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')


Plug 'junegunn/vim-easy-align'
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Autocomplete
Plug 'Shougo/neocomplete.vim'
" Workflow
Plug 'wakatime/vim-wakatime'

" Utility
Plug 'kien/ctrlp.vim'
Plug 'alvan/vim-closetag'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'tpope/vim-fugitive'
Plug 'bronson/vim-trailing-whitespace'
" Plug 'tpope/vim-commentary'
Plug 'tomtom/tcomment_vim'
Plug 'Yggdroot/indentLine'
Plug 'editorconfig/editorconfig-vim'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-surround'
Plug 'mhinz/vim-signify'
" Plug 'ternjs/tern_for_vim'

" Syntax checking
Plug 'vim-syntastic/syntastic'

" Generic Programming Support
Plug 'honza/vim-snippets'
Plug 'maksimr/vim-jsbeautify'

"HTML5 support
Plug 'othree/html5.vim'

"ES6 support
Plug 'othree/yajs.vim', { 'for': 'javascript' }
Plug 'othree/es.next.syntax.vim'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'othree/jspc.vim'
Plug 'moll/vim-node'

" Support JSX
Plug 'mxw/vim-jsx'

" Linting
" Plug 'w0rp/ale'

" Pug/Jade
Plug 'digitaltoad/vim-pug'

" Emmet
Plug 'mattn/emmet-vim'

" JSON
Plug 'elzr/vim-json'

" Javascript Indent
Plug 'jason0x43/vim-js-indent'

" Typescript
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/tsuquyomi'

" Template String Support
Plug 'Quramy/vim-js-pretty-template'

" Vimproc
Plug 'Shougo/vimproc.vim', {'do' : 'make'}

" Theme / Interface
Plug 'ayu-theme/ayu-vim'
Plug 'dracula/vim'
Plug 'hzchirs/vim-material'
Plug 'chriskempson/base16-vim'
Plug 'w0ng/vim-hybrid'
Plug 'herrbischoff/cobalt2.vim'
Plug 'morhetz/gruvbox'
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'


" Syntax highlighting and indent
" Plug 'sheerun/vim-polyglot'

" Initialize plugin system
call plug#end()
