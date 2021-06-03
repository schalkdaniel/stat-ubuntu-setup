" BASIC CONFIGS
" ===========================================================

set backupdir=~/.vim_files/.backup/,.,~/tmp,/var/tmp,/tmp
set directory=~/.vim_files/.swp/,.,~/tmp,/var/tmp,/tmp
set undodir=~/.vim_files/.undo/,.,~/tmp,/var/tmp,/tmp

set ve+=onemore		" Enable cursor to be AFTER the last letter
set noequalalways " Do not always resize panes after closing one

set number		" Add line numbers to files
" set spell          	" Enable spell checking

set tabstop=2        	" Defines the blanks of a tab
set shiftwidth=2	    " Defines how many blanks a shift (<C-t> or <C-d>) is
set expandtab		      " Use spaces instead of tabs!
set autoindent        " Should do indenting automatically
set smartindent		    " Should do indenting automagically
set cindent          	" Indenting for C type languages
set showcmd           " Shows the commands in the lower right corner
set mouse=a
set spell
set relativenumber
set hlsearch

set clipboard=unnamedplus
set backspace=indent,eol,start

" A nicer highlighting of spelling errors:
hi clear SpellBad
hi SpellBad cterm=underline ctermfg=red

" Navigate in completion with j and k instead of C-n and C-p:
"inoremap <expr> j pumvisible() ? "\<C-N>" : "j"
"inoremap <expr> k pumvisible() ? "\<C-P>" : "k"
"
" Custom command to enter a new line in normal mode
map <Enter> O<ESC>

" PLUGIN SECTION
" ===========================================================

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'

call plug#begin('~/.vim/plugged')

" Plugin for file explorer on left side: https://github.com/scrooloose/nerdtree
Plug 'scrooloose/nerdtree'

" Plugin for C++ highlighting: https://github.com/bfrg/vim-cpp-modern
"Plug 'bfrg/vim-cpp-modern'

" Plugin for C++ autocompletion based on clang (required here!): https://github.com/xavierd/clang_complete
"Plug 'xavierd/clang_complete'

" R plugin: https://github.com/jalvesaq/Nvim-R
Plug 'jalvesaq/Nvim-R'

" Plugin to send code to other windows:
"Plug 'karoliskoncevicius/vim-sendtowindow'

" Efficient move commands: https://github.com/matze/vim-move
Plug 'matze/vim-move'
"
" Easy  editing of parantheses:
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-surround'

" Comment shortcuts for a lot of languages
"Plug 'preservim/nerdcommenter'


" Autocompletion for varius languages
"Plug 'neoclide/coc.nvim', {'branch': 'release'}


call plug#end()


" Nvim-R:
" ------------------------

" Set window with and height of Nvim-R:
"if winwidth(0) < 1200
	"let R_rconsole_width = winwidth(0)
"else
	"let R_rconsole_width = winwidth(0) / 2
"endif

"let R_pdfviewer = 'evince'
let g:R_assign = 0                  " Don't create the assign arrow when typing "_"
let R_args = ['--no-save', '--no-restore-data', '--quiet']
"" Send line to R console
autocmd VimEnter * map <C-l> 0\lj


" vim-move:
" -----------------------

" Set Strg as key to move up/down lines (vim-move):
let g:move_key_modifier = 'C'

" Custom commands:
" -----------------------

" Required for clang complete
let g:clang_library_path='/usr/lib64/libclang.so.10'

" Start nerdtree from the beginning:
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

let NERDTreeShowHidden=1

nnoremap <silent> <expr> <C-n> g:NERDTree.IsOpen() ? "\:NERDTreeClose<CR>" : bufexists(expand('%')) ? "\:NERDTreeFind<CR>" : "\:NERDTree<CR>"



