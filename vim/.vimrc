" SOURCES
" https://github.com/W4RH4WK/dotVim/blob/master/vimrc
" http://amix.dk/vim/vimrc.html
" https://gist.github.com/joegoggins/8482408

" needed for many options to work
set nocompatible
set shell=zsh

" ================================================================ VUNDLE
filetype off

" to install vundle on fresh system
" http://erikzaadi.com/2012/03/19/auto-installing-vundle-from-your-vimrc/
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle.."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let iCanHazVundle=0
endif

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Plugin 'gmarik/vundle' " let vundle manage itself

" -------- [ vim plugins ] -------------------------------------
"Plugin 'scrooloose/nerdtree' " file navigator gutter
"Plugin 'scrooloose/nerdcommenter' " commenting
Plugin 'scrooloose/syntastic' " awesome syntax highlighting
Plugin 'chriskempson/base16-vim' " make it look amazing !
Plugin 'bling/vim-airline' " status line
Plugin 'vim-pandoc/vim-pandoc' " writing documents in pandoc
Plugin 'vim-pandoc/vim-pandoc-after' " writing documents in pandoc
Plugin 'vim-pandoc/vim-pandoc-syntax'
"Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
"Plugin 'tpope/vim-fugitive' " make git pervasive in vim 
"Plugin 'Valloric/YouCompleteMe' " autocompletion engine

if iCanHazVundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
endif

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
set shiftwidth=4
set softtabstop=4
set tabstop=4

" -------- [ scrolling  ] --------------------------------------
set scrolloff=8                 " start scrolling when 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" -------- [ text wrap ]  --------------------------------------
set textwidth=80
set wrap linebreak nolist       " set soft wrap, use gj gk to scroll by screen lines
set showbreak=" "

" -------- [ vim command line completion ] ---------------------
set wildmode=longest:list,full
set wildmenu
set wildchar=<Tab>              " default
set wildignorecase

" -------- [ folding ] -----------------------------------------
set foldcolumn=0

" -------- [ status line ] -------------------------------------
set laststatus=2

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

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

if has('gui_running')
  "set guifont=Source\ Code\ Pro\ 10
  set guifont=Anonymous\ Pro\ 12
  set guifontwide=DejaVu\ Sans\ Mono\ 10
endif

set lazyredraw                  " redraw after executing macro (performance gains?)
set listchars=tab:▸\ ,eol:¬,trail:·,nbsp:·
set ruler                       " show cursor position
set ttyfast
set showmatch                   " highlight matching brackets
set gcr=n:blinkon0              " disable cursor blink (doesn't seem to work?)
set cursorline

set cc=80
"highlight ColorColumn ctermbg=darkgray

set t_Co=256
colorscheme base16-brewer
let base16colorspace=256  " Access colors present in 256 colorspace
set background=dark       " let term use brighter colours

" ============================================================== USEFUL BINDINGS

" quick ESC in insert mode
imap jk <ESC>

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
au BufRead,BufNewFile *.md,*.txt setlocal textwidth=80


" Forget about the arrow keys!
nnoremap <UP>    <NOP>
nnoremap <DOWN>  <NOP>
nnoremap <LEFT>  <NOP>
nnoremap <RIGHT> <NOP>
inoremap <UP>    <NOP>
inoremap <DOWN>  <NOP>
inoremap <LEFT>  <NOP>
inoremap <RIGHT> <NOP>

" ============================================================== PLUGIN SPECIFIC SETTINGS



" -------- [ NERDTree Mappings ] -------------------------------
map <leader>n <esc>:NERDTreeToggle<cr>  " Open Nerd Tree with <Leader>n
map <leader>r <esc>:NERDTreeFind<cr>    " Reveal current file in NERDTree with <Leader>r
autocmd vimenter * if !argc() | NERDTree | endif
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary")

" -------- [ SYNTASTIC ] ---------------------------------------
let g:syntastic_enable_signs=1               " mark syntax errors with :signs
let g:syntastic_quiet_messages = {
    \ "!level":  "errors",
    \ "type":    "style" }

let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs = 1
let g:syntastic_auto_loc_list = 2

let g:syntastic_error_symbol = "X"
let g:syntastic_style_error_symbol = ">"
let g:syntastic_warning_symbol = "!"
let g:syntastic_style_warning_symbol = ">"

let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_no_include_search = 0
" let g:syntastic_cpp_compiler_options = " -std=c++11"


" -------- [ YOUCOMPLETEME ] -----------------------------------
"let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

" -------- [ VIM-AIRLINE ] -------------------------------------
let g:bufferline_echo = 0            " prevent automatic echoing to buffer (vim-bufferline)

" -------- [ VIM-PANDOC] ---------------------------------------
let g:pandoc#formatting#mode = "hA"
let g:pandoc#formatting#smart_autoformat_on_cursormoved = 1
let g:pandoc#folding#level = 3
let g:pandoc#folding#mode = "relative"
let g:pandoc#after#modules#enabled = ["nrrwrgn", "tablemode"]
let g:pandoc#completion#bib#mode = 'citeproc'
let g:pandoc#syntax#colorcolumn = 1
