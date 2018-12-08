"=== Pathtogen ===
filetype off

" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'vim-scripts/L9'
Plug 'lukaszb/vim-web-indent'
Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/todo-txt.vim'
Plug 'Valloric/YouCompleteMe'
Plug 'tomasr/molokai'
Plug 'derekwyatt/vim-scala'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'plasticboy/vim-markdown'
Plug 'chase/vim-ansible-yaml'
Plug 'phenomenes/ansible-snippets'
Plug 'ekalinin/Dockerfile.vim'
Plug 'airblade/vim-gitgutter'
Plug 'pearofducks/ansible-vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'
Plug 'lambdalisue/vim-pyenv'
Plug 'fatih/vim-go'
Plug 'w0rp/ale'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'LLluma/rope-vim'
Plug 'honza/vim-snippets'
Plug 'ryanoasis/vim-devicons'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'

" Initialize plugin system
call plug#end()

filetype plugin indent on

set nocompatible               " be iMproved
let mapleader = ","
let maplocalleader = ","
set scrolloff=3

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
syntax enable
set numberwidth=3
" Switch to alternate file
map <C-Tab> :bNext!<cr>
map <S-Tab> :bNext!<cr>
map <C-S-Tab> :bprevious!<cr>

set colorcolumn=119

set clipboard+=unnamed  " use the clipboards of vim and win
set go+=a               " Visual selection automatically copied to the clipboard<Paste>

vnoremap < <gv
vnoremap > >gv


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


syntax on		" syntax highlight
set hlsearch		" search highlighting
set cursorline        " highlight current line

syntax enable
"set term=xterm-256color
set t_Co=256
let g:rehash256=1
let g:molokai_original=1
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

set expandtab        "replace <TAB> with spaces
set softtabstop=4
set shiftwidth=4
set tabstop=4

" status line {
set laststatus=2


"---------------------------------------------------------------------------
" USEFUL SHORTCUTS
"---------------------------------------------------------------------------
" set leader to ,
let mapleader=","
let g:mapleader=","

"replace the current word in all opened buffers
map <leader>r :call Replace()<CR>

" open the error console
map <leader>cc :botright cope<CR>
" move to next error
map <leader>] :cn<CR>
" move to the prev error
map <leader>[ :cp<CR>

" --- move around splits {
" move to and maximize the below split
map <C-J> <C-W>j<C-W>_
" move to and maximize the above split
map <C-K> <C-W>k<C-W>_
" move to and maximize the left split
nmap <c-h> <c-w>h<c-w><bar>
" move to and maximize the right split
nmap <c-l> <c-w>l<c-w><bar>
set wmw=0                     " set the min width of a window to 0 so we can maximize others
set wmh=0                     " set the min height of a window to 0 so we can maximize others
" }

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