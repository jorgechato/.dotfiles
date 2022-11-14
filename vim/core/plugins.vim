call plug#begin(expand('$HOME/.vim/plugged'))

"*****************************************************************************
"" Main Plug
"*****************************************************************************
" Themes
Plug 'cormacrelf/vim-colors-github'
Plug 'projekt0n/github-nvim-theme'

" IDE
"Plug 'github/copilot.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'easymotion/vim-easymotion'
Plug 'Yggdroot/indentLine'
Plug 'scrooloose/nerdcommenter'
Plug 'editor-bootstrap/vim-bootstrap-updater'
Plug 'tpope/vim-dotenv'
Plug 'tpope/vim-abolish'
Plug 'ap/vim-css-color'

" Autocomplete
Plug 'sirver/ultisnips'
Plug 'neoclide/coc.nvim', {'tag': 'v0.0.81'}

" Debug
Plug 'puremourning/vimspector'

" Syntax
Plug 'sheerun/vim-polyglot'
Plug 'vim-syntastic/syntastic'
Plug 'dense-analysis/ale'

" Typing
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'ervandew/supertab'
Plug 'godlygeek/tabular'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Navigation
Plug 'tpope/vim-vinegar'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'danro/rename.vim'
Plug 'mileszs/ack.vim'
Plug 'vim-scripts/grep.vim'

" Frame
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"*****************************************************************************
"" Custom bundles
"*****************************************************************************
" ML
" " Kite Bundle
"Plug 'kiteco/vim-plugin'

" go
"" Go Lang Bundle
Plug 'fatih/vim-go', {'do': ':GoInstallBinaries'}

" javascript
"" Javascript Bundle
Plug 'jelera/vim-javascript-syntax'

" python
"" Python Bundle
"Plug 'davidhalter/jedi-vim'
Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}

" vuejs
Plug 'posva/vim-vue'
Plug 'leafOfTree/vim-vue-plugin'

" Rust
Plug 'rust-lang/rust.vim'
"*****************************************************************************
" Initialize plugin system
call plug#end()
