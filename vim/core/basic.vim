set nocompatible                        " I'm using vim not vi

filetype plugin indent on
"*****************************************************************************
"" Basic Options
"*****************************************************************************
set encoding=utf-8
set hidden
set shell=/bin/zsh
set showcmd                             " Show info in the right bottom
set ttyfast
set formatoptions=qcrn1
set pastetoggle=<F8>
set mouse=a                             " Mouse srolling
set noerrorbells                        " No noise.
set lazyredraw
set autoread                            " Reload file if it's modified outside
set autowrite
set autoindent
set smartindent
set smarttab
set nolist								" Change to list to enable listchars
set penc="cp1252"
set wildignore+=*.pyc,*.swp,*.pdf,*.class

" Backups
if !has('nvim')
    set backupskip=/tmp/*,/private/tmp/*"
    set undodir=~/.vim/tmp/undo//
    set backupdir=~/.vim/tmp/backup//
    set directory=~/.vim/tmp/swap//
    set backup
    set noswapfile
endif
