" ============================================
" ============ NVIM HACKER CONFIG ============
" ============================================

call plug#begin()
    " Appearance
    Plug 'folke/tokyonight.nvim'
    Plug 'vim-airline/vim-airline'
    Plug 'ryanoasis/vim-devicons'

    " Utilities
    Plug 'sheerun/vim-polyglot'
    Plug 'ap/vim-css-color'
    Plug 'preservim/nerdtree'

    " Completion / linters / formatters
    Plug 'plasticboy/vim-markdown'

    " Git
    Plug 'airblade/vim-gitgutter'
call plug#end()

syntax on

let mapleader = "\\"

set encoding=UTF-8

" Display
colorscheme tokyonight-night
set title
set relativenumber
set splitbelow splitright

" Formatting
set tabstop=2 softtabstop=2     " Spaces for tabs
set shiftwidth=2                " Spaces for identation
set expandtab                   " Transforms tabs into spaces

" Utilities
set clipboard=unnamedplus       " Enables clipboard with another application
set wildmenu
set completeopt=menuone,noinsert,noselect " Autocomplete

set timeoutlen=1000 ttimeoutlen=0   " Time in ms to run commands
set pastetoggle=<F3>
set noerrorbells
set smartindent
set nu
set nowrap
set smartcase
set nobackup
set nowritebackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set noshowmode
set shortmess+=c
set cmdheight=2
set updatetime=50
set mouse=a
set foldlevelstart=20

" Keybindings
nnoremap <F5> :NERDTreeToggle<CR>
nnoremap <F6> :sp<CR>:terminal<CR>
