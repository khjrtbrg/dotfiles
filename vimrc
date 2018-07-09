""""""""""""""""
" Vundle Setup "
""""""""""""""""
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'


""""""""""""
" Settings "
""""""""""""
let mapleader = " "
let g:mapleader = " "

" Fast saving
nmap <leader>w :w!<cr>

" Nice things to have
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-rsi'

Plugin 'tpope/vim-vinegar'
autocmd FileType netrw map <buffer> <leader>w :bwipeout<cr>

Plugin 'ctrlpvim/ctrlp.vim'
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others']
let g:ctrlp_working_path_mode = 0
let g:ctrlp_follow_symlinks = 2

" Visual things
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 1
let g:airline_theme='dark'

" Indentation & Syntax
Plugin 'tpope/vim-endwise'
Plugin 'conormcd/matchindent.vim'
Plugin 'godlygeek/tabular'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-rails'
Plugin 'ap/vim-css-color'
Plugin 'Keithbsmiley/rspec.vim'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-markdown'

" linting
Plugin 'w0rp/ale'
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0

Plugin 'pangloss/vim-javascript'
let g:javascript_plugin_flow = 1

Plugin 'mxw/vim-jsx'
let g:jsx_ext_required = 0

" Other random settings
let g:rehash256 = 1
let g:molokai_original = 1
set t_Co=256
color molokai

set nobackup
set nowritebackup
set noswapfile
set backupdir=~/.vim/backup
set directory=~/.vim/backup

syntax on
set nohidden
set history=10000
set number
set ruler
set switchbuf=useopen
set encoding=utf-8

set formatoptions=cr
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set list listchars=tab:\ \ ,trail:·

set hlsearch
set incsearch
set ignorecase
set smartcase

set wildmode=longest,list
set wildmenu
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*,public/javascripts/compiled
set wildignore+=tmp,*.orig,*.jpg,*.png,*.gif,log,solr,.sass-cache,.jhw-cache
set wildignore+=bundler_stubs,build,error_pages,bundle,build,error_pages

set laststatus=2

set showcmd

set noerrorbells
set visualbell
set t_vb=

set modeline
set modelines=10

set splitbelow
set splitright

set ttyfast
set lazyredraw
syntax sync minlines=256

set scrolloff=2

set ttimeoutlen=5

set backspace=indent,eol,start

set undofile
set undodir=$HOME/.vim/undo

set undolevels=1000
set undoreload=10000

set colorcolumn=90

" set to audo read when a file is changed from outside
set autoread

let g:expandWindows = 1


"""""""""""""""""""
" Finish vundling "
"""""""""""""""""""
call vundle#end()
filetype plugin indent on
