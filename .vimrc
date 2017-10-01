" =============================================================================
" General settings
" =============================================================================

" base
set nocompatible                    " vim, not vi
syntax on                           " syntax highlighting
filetype plugin indent on           " try to recognise filetype and load plugins and indent files

" set true colors and add vim specific fixes
set termguicolors
set t_8f=[38;2;%lu;%lu;%lum
set t_8b=[48;2;%lu;%lu;%lum

" interface
set background=dark                 " set vim's backgournd to dark
set colorcolumn=100                 " show a column at 100 chars
set cursorline                      " highlight current line
set ruler                           " show current position at bottom
set scrolloff=5                     " keep at line 5 lines above/below
set showcmd                         " show any commands
set sidescroll=1                    " smoother horizontal scrolling
set number                          " show line number
set hidden

set guioptions-=r                   " Removes right hand scroll bar
set go-=L                           " Removes left hand scroll bar

" White space
set expandtab                       " use tabs instead of spaces
set nojoinspaces                    " use one space, not two, after punctuation
set shiftround                      " shift to next tabstop
set tabstop=2                       " use 2 spaces for tab
set softtabstop=2                   " appearance of tabs
set shiftwidth=2                    " amount of space used for indentation
set smarttab

" text appearance
set nowrap                          " disable line wrapping
set synmaxcol=200                   " stop syntax highlighting after 200 columns
" set list                          " show invisible characters
" set listchars=tab:>·,trail:·,nbsp:¬ " but only show useful chaaracters

" interaction
set backspace=2                     " make backspace work like most other apps
set backspace=indent,eol,start      " OSX stupid backspace fix
set mouse=a                         " enable mouse support
set mousehide                       " hide the mouse cursor while typing
set whichwrap=b,s,h,l,<,>,[,]       " backspace and cursor keys wrap too
set autowrite                       " autosave buffer when switching between buffer

" searching
set hlsearch                        " highlight search matches
set ignorecase                      " set case insensitive searching
set incsearch                       " find as you type search
set smartcase                       " case sensitive searching when not all lowercase

" background processes
set autoread                        " update file when changed outside of vim
set autoindent                      " copy indentation from the previous line for new line
set smartindent                     " set smartindent
set history=200                     " store last 200 commands as history
set nobackup                        " don't save backups
set noerrorbells                    " no error bells please
set noswapfile                      " no swapfiles
set nowritebackup                   " don't save a backup while editing
set lazyredraw                      " see if this fixes the slowness
set ttyfast                         " indicates a fast terminal connection
set undodir=~/.vim/undodir          " set undofile location
set undofile                        " maintain undo history between sessions
set undolevels=1000                 " store 1000 undos

" character encoding
if !&readonly && &modifiable
  set fileencoding=utf-8            " the encoding written to file
endif
set encoding=utf-8                  " the encoding displayed

" font
if has('gui_running')
  set guioptions-=m                 " No menu bar
  set guioptions-=T                 " No toolbar
  if has('gui_win32')
    set guifont=FiraCode_NF:h12:cANSI
    set linespace=6
  else
    set guifont=Inconsolata\ for\ Powerline\ 14
  endif
else
  if exists("+lines")               " This is console Vim.
    set lines=50
  endif
  if exists("+columns")
    set columns=100
  endif
endif


" =============================================================================
" Keys
" =============================================================================

" set leader to space
let mapleader = " "

" map semicolon to colon and vice versa
" nnoremap ; :
" nnoremap : ;
" vnoremap ; :
" vnoremap : ;

" adjust window size with arrow keys
" noremap <right> <C-w>5>
" noremap <left> <C-w>5<
" noremap <up> <C-w>5+
" noremap <down> <C-w>5-

" formast pasted text automatically
nnoremap p ]p
nnoremap <c-p> p

" keep selection after indent
vnoremap < <gv
vnoremap > >gv

" sort
vnoremap <leader>s :sort<CR>

" recalculate syntax highlighting
nnoremap <leader>s :syntax sync fromstart<CR>

" reload vim config
nnoremap <leader>r :source $MYVIMRC<CR>

" clear search
nnoremap <leader>c :let @/ = ""<CR>

" select all
nnoremap <leader>a ggVG<CR>

" copy all
nnoremap <leader>y ggVGy<CR>

" upper or lowercase the current word
nnoremap <leader>^ gUiW
nnoremap <leader>v guiW

" cycle through changelist
nnoremap <leader>- g;
nnoremap <leader>= g,

" cycle through jumplist
nnoremap <leader>, <C-o>
nnoremap <leader>. <C-i>

" cycle through quickfix list
noremap <leader>[ :cprev<CR>
noremap <leader>] :cnext<CR>


" enable Elite mode, No ARRRROWWS!!!!
let g:elite_mode=1
" disable arrow movement, resize splits instead.
if get(g:, 'elite_mode')
  nnoremap <Up>    :resize +2<CR>
  nnoremap <Down>  :resize -2<CR>
  nnoremap <Left>  :vertical resize +2<CR>
  nnoremap <Right> :vertical resize -2<CR>
endif


" =============================================================================
" Autocommands
" =============================================================================

augroup vimrcEx
  autocmd!

  " disable comment continuation
  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

  " hide hidden characters in nerdtree buffer
  autocmd FileType nerdtree setlocal nolist
augroup END


" =============================================================================
" Searching
" =============================================================================

if executable('ag')
  " use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " define Ag command
  command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

  " bind \ to grep shortcut
  nnoremap \ :Ag<SPACE>
endif

" Make jj do esc"
inoremap jj <Esc>

" No sound in GVim
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

" Hide carriage return character
for i in ['cterm', 'gui']
  for j in ['fg', 'bg']
    let c = synIDattr(hlID('Normal'), 'bg', i)
    if (!empty(c))
      exec 'highlight CarriageReturn ' . i . j . '=' . c
    endif
  endfor
endfor
if hlID('CarriageReturn')
  match CarriageReturn /\r$/
endif


" Mapping key for running JS inside vim
map <F7> :call RunNode() <cr>
function RunNode()
  exec "! node %"
endfunction

" Mapping key for running JS in browser
map <F5> <Esc>:silent !chrome %<cr>


" =============================================================================
" Load plugins
" =============================================================================

source $HOME/.vimrc.plugins.vim

" =============================================================================
" Load configs
" =============================================================================

source $HOME/.vimrc.config-theme.vim
source $HOME/.vimrc.config-plugins.vim


" =============================================================================
" Load plugins
" =============================================================================

source $HOME/.vimrc.airline.vim


