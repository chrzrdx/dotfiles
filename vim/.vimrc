" SOURCES
" https://github.com/W4RH4WK/dotVim/blob/master/vimrc
" http://amix.dk/vim/vimrc.html
" https://gist.github.com/joegoggins/8482408

" needed for many options to work
set nocompatible
set shell=zsh

" ================================================================ VUNDLE
filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" let vundle manage itself
Bundle 'gmarik/vundle'

" -------- [ vim plugins ] -------------------------------------

" make git pervasive in vim ( :Gblame + Glog + many more )
Bundle 'tpope/vim-fugitive'

" file navigator gutter
Bundle 'scrooloose/nerdtree'

" commenting
Bundle 'scrooloose/nerdcommenter'

" awesome syntax highlighting
Bundle 'scrooloose/syntastic'

" autocompletion engine
"Bundle 'Valloric/YouCompleteMe'

" make it look amazing !
"Bundle 'altercation/vim-colors-solarized'
"Bundle 'jnurmine/Zenburn'
Bundle 'chriskempson/base16-vim'

" status line
Bundle 'bling/vim-airline'

" writing documents in pandoc
Bundle 'vim-pandoc/vim-pandoc'
Bundle 'vim-pandoc/vim-pandoc-syntax'

Bundle 'kien/ctrlp.vim'
"Bundle 'tpope/vim-surround'

" python-mode for vim, uses pyflakes, pylint, rope
"Bundle 'klen/python-mode'

" ============================================================== GENERAL

" -------- [ basic settings ] ----------------------------------
set number                      " set line numbers
set backspace=indent,eol,start  " allow backspace in insert mode
set whichwrap+=<,>,h,l          " wrap cursor to next/prev line
set history=1000                " store lots of :cmdline history
set showcmd                     " show incomplete cmds down the bottom
set showmode                    " show current mode down the bottom

filetype plugin on              " load ftplugins files
set ffs=unix,dos,mac            " use Unix as the standard file type
set encoding=utf-8
set fileencoding=utf-8          " set utf-8
set autoread                    " autoreload files changed outside vim

syntax on                       " syntax highlighting
set magic                       " for regex

" buffer becomes hidden when it is abandoned
" http://items.sjbach.com/319/configuring-vim-right
set hidden

" set mapleader for extra key combos !
let mapleader=","
let g:mapleader=","

" -------- [ search ] ------------------------------------------
set ignorecase
set smartcase
set hlsearch                    " highlight search results
set incsearch                   " incremental search, like in modern browsers

" -------- [ indentation ] -------------------------------------
set autoindent
set smartindent
set expandtab
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=4

" -------- [ scrolling  ] --------------------------------------
set scrolloff=8                 " start scrolling when 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" -------- [ text wrap ]  --------------------------------------
"set textwidth=72
"set wrap linebreak nolist       " set soft wrap, use gj gk to scroll by screen lines

" -------- [ vim command line completion ] ---------------------
set wildmode=longest:list,full
set wildmenu
set wildchar=<Tab>              " default
set wildignorecase


" -------- [ folding ] -----------------------------------------
set foldcolumn=0

" -------- [ status line ] -------------------------------------
set laststatus=2

"" http://got-ravings.blogspot.in/2008/08/vim-pr0n-making-statuslines-that-own.html
"set statusline=[%n]\ %<%.99f\ %h%w%m%r%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%y%=%-16(\ %l,%c-%v\ %)%P

"" http://nion.modprobe.de/setup/vimrc
"let s  = ""
"let s .= "%<"               |  " truncate at the start
"let s .= "%f%8* "           |  " file name
"let s .= "%r"               |  " readonly flag
"let s .= '%{&bomb?"!":""} ' |  " byte-order mark flag
"let s .= "%*%="             |  " right-justify after here
"let s .= "%9*%m%* "         |  " modified flag
"let s .= "0x%02B "          |  " hex value of current byte
"let s .= "%l"               |  " current line
"let s .= ":%c%V"            |  " column number, virtual column (if different)
"let s .= " %P"              |  " percentage
"let s .= "/%LL"             |  " number of lines
"set statusline=%!s

" turn off swap/backup
set noswapfile
set nobackup
set nowb

" no annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" to get the mouse going in term
set mouse=a
set ttymouse=xterm2


" ============================================================== VISUAL

set t_Co=256
"let base16colorspace=256  " Access colors present in 256 colorspace

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

if has('gui_running')
  set guifont=Inconsolata\ 10
  set guifontwide=DejaVu\ Sans\ Mono\ 10
endif

set encoding=utf-8
set lazyredraw                  " redraw after executing macro (performance gains?)
set listchars=tab:>\ ,eol:\
set ruler                       " show cursor position
set ttyfast
set showmatch                   " highlight matching brackets
set gcr=n:blinkon0              " disable cursor blink (doesn't seem to work?)

set cursorline

"set cc=80
"highlight ColorColumn ctermbg=darkgray

colorscheme base16-monokai
let base16colorspace=256  " Access colors present in 256 colorspace
set background=dark             " let term use brighter colours

" ============================================================== USEFUL BINDINGS

" quick ESC in insert mode
imap jj <ESC>

" jump to the next row on long lines
map <Down> gj
map <Up>   gk
nnoremap j gj
nnoremap k gk

" use Ctrl+n to disable highlighted search terms
nmap <silent> <C-n> :noh<CR>

" fast(er) saving ?
nmap <leader>w :w!<cr>

" :W saves with sudo
command W w !sudo tee % > /dev/null

" toggle paste mode on and off
map <leader>pp :setlocal paste! paste?<cr>

" pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell! spell?<cr>

" remove the Windows ^M - when the encodings gets messed up
noremap <leader>mm mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" ============================================================== FILETYPE SPECIFIC SETTINGS

" set textwidth at 72chars for markdown, txt files
au BufRead,BufNewFile *.md,*.txt setlocal textwidth=72

" ============================================================== PLUGIN SPECIFIC SETTINGS

" -------- [ NERDTree Mappings ] -------------------------------
map <leader>n <esc>:NERDTreeToggle<cr>  " Open Nerd Tree with <Leader>n
map <leader>r <esc>:NERDTreeFind<cr>    " Reveal current file in NERDTree with <Leader>r

" -------- [ SYNTASTIC ] ---------------------------------------
let g:syntastic_enable_signs=1               " mark syntax errors with :signs
let g:syntastic_auto_jump=0                  " automatically jump to the error when saving the file
let g:syntastic_auto_loc_list=1              " show the error list automatically
let g:syntastic_quiet_messages='warnings'    " don't care about warnings

" -------- [ YOUCOMPLETEME ] -----------------------------------
"let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"

" -------- [ VIM-AIRLINE ] -------------------------------------
"let g:airline_theme='solarized'          " set theme
let g:bufferline_echo = 0            " prevent automatic echoing to buffer (vim-bufferline)
"let g:airline_powerline_fonts = 1    " enable support for powerline symbols

" -------- [ PYTHON-MODE ] -------------------------------------
" fixed random hanging with new version of python-mode
"call pymode#default('g:pymode_rope_autoimport', 0)
