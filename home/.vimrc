execute pathogen#infect()
set nocompatible                  " explicitely get out of vi-compatible mode
filetype plugin indent on         " load filetype-based indentation


" see http://vim.wikia.com/wiki/Detect_non-Unicode_Xterms
if has("multi_byte")
  set encoding=utf-8
  if $TERM == "linux" || $TERM_PROGRAM == "GLterm"
    set termencoding=latin1
  endif
  if $TERM == "xterm" || $TERM == "xterm-color"
    let propv = system("xprop -id $WINDOWID -f WM_LOCALE_NAME 8s ' $0' -notype WM_LOCALE_NAME")
    if propv !~ "WM_LOCALE_NAME .*UTF.*8"
      set termencoding=latin1
    endif
  endif
endif

" Apprearance
set background=dark               " optimize for dark background
syntax on                         " turn on syntax highlighting
set number                        " show line numbers
if has("gui_running")             " gvim section
    colorscheme desert            " change to a dark color scheme
    set guifont=Inconsolata\ 8    " change font
endif


" Behaviour
set backspace=indent,eol,start    " make backspace more flexible
set whichwrap=b,s,<,>,~,[,]       " all wrapping chars
set ignorecase                    " ignore case in searched
set infercase                     " infer case (?)
set smartcase                     " when I use caps, go case sensitive
set incsearch                     " incremental search
set hidden                        " put buffers in background, don't close them 
set wildmode=longest,list,full    " autocomplete: fill longest, list choices, pick first
set wildmenu                      " enable autocomplete

" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo

" Formatting
set autoindent                    " indent automatically
set expandtab                     " no real tabs
set wrap                          " wrap lines by default
set shiftround                    " when at 3 spaces, <tab> goes to 4 not 7
set shiftwidth=4                  " 4-char auto-indent
set softtabstop=4                 " 4-char tabs
set tabstop=4                     " 4-char tabs
set hlsearch                      " highlight search results


" Shortcuts 
set pastetoggle=<F3>              " make <F3> the paste-toggle key
" F1,F2 -> previous,next buffer
map <F1> :bprev<CR>
map <F2> :bnext<CR>
map <F5> :! clear; perl %<CR>
if has("gui_running")
    map  <silent>  <S-Insert>  "+p
    imap <silent>  <S-Insert>  <Esc>"+pa
endif
autocmd FileType python nnoremap <buffer> <f9> :exec '!python' shellescape(@%, 1)<cr>

" <F6> toggles spell-checking on local buffer (also in insert mode)
:map <F6> :setlocal spell! spelllang=en_gb<CR>
inoremap <F6> <C-\><C-O>:setlocal spelllang=en_gb spell! spell?<CR>

