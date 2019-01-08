"=== Pathtogen ===
filetype off

" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'LLluma/rope-vim'
Plug 'SirVer/ultisnips'
Plug 'Valloric/YouCompleteMe'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'airblade/vim-gitgutter'
Plug 'chase/vim-ansible-yaml'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'derekwyatt/vim-scala'
Plug 'ekalinin/Dockerfile.vim'
Plug 'fatih/vim-go'
Plug 'honza/vim-snippets'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'lambdalisue/vim-pyenv'
Plug 'lukaszb/vim-web-indent'
Plug 'pearofducks/ansible-vim'
Plug 'phenomenes/ansible-snippets'
Plug 'plasticboy/vim-markdown'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'tomasr/molokai'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-ruby/vim-ruby'
Plug 'vim-scripts/L9'
Plug 'vim-scripts/todo-txt.vim'
Plug 'w0rp/ale'

" Initialize plugin system
call plug#end()

filetype plugin indent on

set nocompatible               " be iMproved
let mapleader = ","
let maplocalleader = ","
set scrolloff=3
set fillchars=""

"Change terminal cursor in insert mode
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

"Airline settings
let g:airline_mode_map = {
    \ '__' : '--',
    \ 'n'  : 'N',
    \ 'i'  : 'I',
    \ 'R'  : 'R',
    \ 'c'  : 'C',
    \ 'v'  : 'V',
    \ 'V'  : 'V-L',
    \ '' : 'V-B',
    \ 's'  : 'S',
    \ 'S'  : 'S-L',
    \ '' : 'S-B',
    \ 't'  : 'T',
    \ }
let g:airline_powerline_fonts = 1
let g:airline_theme='molokai'

"FZF
nnoremap <leader>f :Files<CR>
nnoremap <leader>s :Snippets<CR>
nnoremap <leader>a :Ag<CR>
nnoremap <leader>g :GFiles?<CR>

"ALE
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_linters = {'python': ['flake8', 'pyflakes'], 'ruby': ['rubocop', 'brakeman']}
let g:ale_fixers = {'python': ['isort'], '*': ['trim_whitespace', 'remove_trailing_lines']}
let g:ale_python_isort_options = '--multi-line=3 --trailing-comma --wrap-length=80'
nnoremap <leader>t :ALEFix<CR>

" YouCompleteMe
let g:ycm_key_list_select_completion = ['<C-n>']
let g:ycm_key_list_previous_completion = ['<C-p>']

"Spell
set spelllang=en_us

filetype plugin indent on     " required!
set numberwidth=3
" Switch to alternate file
nnoremap <C-f> :bNext!<cr>
nnoremap <C-d> :bprevious!<cr>

set colorcolumn=119

set go+=a               " Visual selection automatically copied to the clipboard<Paste>

vnoremap < <gv
vnoremap > >gv

noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p

set backupdir=./.backup,/tmp
set directory=./.backup,/tmp

set nowrap
set number

" General Settings

set bs=2		" allow backspacing over everything in insert mode
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set autoread		" auto read when file is changed from outside

set undofile
set undodir=$HOME/.vim/.undo
set undolevels=1000


filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins


" auto reload vimrc when editing it
autocmd! bufwritepost .vimrc source ~/.vimrc


syntax on
set hlsearch
set cursorline

syntax enable
set t_Co=256
let g:rehash256=1
colorscheme molokai

set showmatch		" Cursor shows matching ) and }
set showmode		" Show current mode
set wildchar=<TAB>	" start wild expansion in the command line using <TAB>
set wildmenu            " wild char completion menu

" ignore these files while expanding wild chars
set wildignore=*.o,*.class,*.pyc

set autoindent		" auto indentation
set incsearch		" incremental search
set copyindent		" copy the previous indentation on autoindenting
set ignorecase		" ignore case when searching
set smartcase		" ignore case if search pattern is all lowercase,case-sensitive otherwise
set smarttab		" insert tabs on the start of a line according to context

" disable sound on errors
set t_vb=
set tm=500

set expandtab
set softtabstop=4
set shiftwidth=4
set tabstop=4

" status line {
set laststatus=2

" set leader to ,
let mapleader=","
let g:mapleader=","

" move to next error
map <leader>] :cn<CR>
" move to the prev error
map <leader>[ :cp<CR>

" ,/ turn off search highlighting
nmap <leader>/ :nohl<CR>

"---------------------------------------------------------------------------
" ENCODING SETTINGS
"---------------------------------------------------------------------------
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,big5,gb2312,latin1

"Ignore list for netrw
let g:netrw_list_hide= '.*\.pyc$\|.*\.un\~$'

set statusline+=%#warningmsg#
set statusline+=%*

set tags="./.tags,~/.vimtags,./.git/tags"

"=======NerdTree==========
map <C-n> :NERDTreeToggle<CR>

set textwidth=119
set colorcolumn=+1
