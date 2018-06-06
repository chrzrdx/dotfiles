" AUTOINSTALL VIM-PLUG {{{
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif
"}}}

" SET LEADER {{{
let g:mapleader=" "
" }}}

" PLUGINS + SETTINGS {{{
call plug#begin('~/.config/nvim/plugged')

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

" vim-plug settings {{{
let g:plug_timeout=20
"}}}
Plug 'itchyny/lightline.vim' 
" lightline settings {{{
let g:lightline = {
	  \ 'colorscheme': 'gruvbox',
	  \ 'active': {
	  \   'left': [ [ 'mode', 'paste' ],
	  \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
	  \ },
	  \ 'component': {
	  \   'readonly': '%{&filetype=="help"?"":&readonly?"⭤":""}',
	  \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
	  \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
	  \ },
	  \ 'component_visible_condition': {
	  \   'readonly': '(&filetype!="help"&& &readonly)',
	  \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
	  \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
	  \ },
	  \ }
"}}}
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary' ", { 'on': '<Plug>Commentary' } 
Plug 'benekastah/neomake', { 'on': ['Neomake'] } 
" neomake settings {{{
autocmd! BufWritePost * Neomake
let g:neomake_cpp_enable_markers=['clang']
let g:neomake_cpp_clang_args = ["-std=c++14", "-Wextra", "-Wall", "-fsanitize=undefined","-g"]
let g:neomake_verbose=0
let g:neomake_warning_sign = {
	  \ 'text': '>>',
	  \ 'texthl': 'WarningMsg',
	  \ }
let g:neomake_error_sign = {
	  \ 'text': '!>',
	  \ 'texthl': 'ErrorMsg',
	  \ }
"}}}
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" deoplete settings {{{
let g:deoplete#enable_at_startup=1
let g:deoplete#enable_refresh_always=1
let g:deoplete#file#enable_buffer_path=1
let g:deoplete#auto_completion_start_length=2
let g:deoplete#disable_auto_complete=1

let g:deoplete#sources={}
let g:deoplete#sources._    = ['buffer', 'file', 'ultisnips']
let g:deoplete#sources.vim  = ['buffer', 'member', 'file', 'ultisnips']
"}}}
Plug 'vim-pandoc/vim-pandoc' , { 'for': [ 'pandoc', 'markdown' ] }
" vim-pandoc settings {{{
let g:pandoc#formatting#mode = "hA"
let g:pandoc#formatting#smart_autoformat_on_cursormoved = 1
let g:pandoc#folding#level = 3
let g:pandoc#folding#mode = "relative"
let g:pandoc#after#modules#enabled = ["nrrwrgn", "tablemode"]
let g:pandoc#completion#bib#mode = 'citeproc'
let g:pandoc#syntax#colorcolumn = 1
let g:pandoc#modules#disabled = ["folding", "spell"]
let g:pandoc#syntax#conceal#use = 0
"}}}
Plug 'vim-pandoc/vim-pandoc-syntax', { 'for': [ 'pandoc', 'markdown' ] }
Plug 'vim-pandoc/vim-pandoc-after', { 'for': [ 'pandoc', 'markdown' ] }
Plug 'tpope/vim-surround'
Plug 'Shougo/neomru.vim'
Plug 'morhetz/gruvbox'
" gruvbox settings {{{
if $TERM=='st-256color' 
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
elseif $TERM=='xterm-termite' 
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" else
"   let $NVIM_TUI_ENABLE_TRUE_COLOR=0
endif 
let g:gruvbox_sign_column='bg1'
let g:gruvbox_color_column='bg1'
let g:gruvbox_bold=1
" let g:gruvbox_italic=1
" let g:gruvbox_underline=1
" let g:gruvbox_undercurl=1
" let g:gruvbox_termcolors=256
let g:gruvbox_contrast_dark="hard"
let g:gruvbox_contrast_light="hard"
" let g:gruvbox_hls_cursor="orange"
let g:gruvbox_vert_split="dark0"
let g:gruvbox_invert_selection=0
let g:gruvbox_invert_signs=0
let g:gruvbox_invert_indent_guides=0
let g:gruvbox_invert_tabline=0
let g:gruvbox_improved_warnings=1
" }}}
Plug 'godlygeek/csapprox'

call plug#end()
"}}}

" REGULAR SETTINGS {{{

" neovim defaults {{{
" https://neovim.io/doc/user/vim_diff.html#nvim-option-defaults

if has('autocmd')
  filetype plugin indent on     " load ftplugins files
endif
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

" settings based on :help nvim-option-defaults
set autoindent
set autoread                    " autoreload files changed outside vim
set backspace=indent,eol,start  " allow backspace in insert mode
set complete-=i
set display=lastline
set encoding=utf-8
set formatoptions=tcqj
set history=10000
set hlsearch                    " highlight search results
set incsearch                   " incremental search, like in modern browsers
set langnoremap
set laststatus=2
set mouse=a
set nrformats=hex
set sessionoptions-=options
set smarttab
set tabpagemax=50
set tags=./tags;,tags
set ttyfast
set viminfo+=!
set wildmenu

" allow for mappings including Esc, while preserving zero timeout after pressing it manually
set ttimeout
set ttimeoutlen=100

" Load matchit.vim, if a newer version isn't already installed.
" Neovim includes matchit.vim as a regular plug-in.
if !exists("g:loaded_matchit") && findfile("plugin/matchit.vim", &runtimepath) ==# ""
  runtime! macros/matchit.vim
endif

"}}}

" standard settings {{{
set number                      " set line numbers
set whichwrap+=<,>,h,l          " wrap cursor to next/prev line
set showmode                    " show current mode down the bottom
set ffs=unix,dos,mac            " use unix as the standard file type
set magic                       " for regex
set shell=/bin/zsh              " setting shell to zsh
set showcmd                     " show commands as you type them
set textwidth=80                " text width is 80 characters
set cmdheight=1                 " command line height
set pumheight=10                " completion window max size
set hidden                      " enables to switch between unsaved buffers and keep undo history
set clipboard+=unnamed          " allow to use system clipboard
set lazyredraw                  " don't redraw while executing macros (better performance)
set matchtime=2                 " How many tenths of a second to blink when matching brackets
set showmatch                   " show matching brackets when text indicator is over them
set virtualedit=block           " to be able to select past eol in visual block mode
set nojoinspaces                " no extra space when joining a line which ends with . ? !
set scrolloff=5                 " scroll when closing to top or bottom of the screen
set updatetime=1000             " update time used to create swap file or other things
set mouse=a                     " use mouse
set formatoptions-=t            " turn off auto wrap
" wildmenu : autocomplete commands {{{
set wildmode=longest,full       " for wildmenu, autocomplete as much as you can
set wildignore+=*.o,*.out,*.obj,.git
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*.swp,*~,._*
" }}}

"}}}

" split settings (more natural) {{{
set splitbelow                              " splitting a window will put the new window below the current
set splitright                              " splitting a window will put the new window right of the current
"}}}

" visual, color and highlighting settings {{{
set background=dark " let term use brighter colours
silent! colorscheme gruvbox

hi! link Conceal Operator
" hi MatchParen cterm=bold ctermbg=none ctermfg=Yellow

" set cursorline

"}}}

" searching {{{
set ignorecase                              " ignore case by default
set smartcase                               " make search case sensitive only if it contains uppercase letters
set wrapscan                                " search again from top when reached the bottom
"}}}

" persistent undo settings {{{
if has('persistent_undo')
  set undofile
  set undodir=~/.config/nvim/tmp/undo//
endif
"}}}

" indentation {{{
set smartindent
set softtabstop=4
set tabstop=4
set shiftwidth=4
set shiftround
set expandtab
"}}}

" folding {{{
" set foldcolumn=2
"}}}

" fix annoyances {{{
" turn off swap/backup
set noswapfile                  " new buffers will be loaded without creating a swapfile
set nobackup
set nowb

" no annoying sound on errors
set noerrorbells
set novisualbell
" }}}

"}}}

" KEY MAPPINGS {{{

" vim hardmode {{{
nnoremap <up> <NOP>
nnoremap <down> <NOP>
nnoremap <left> <NOP>
nnoremap <right> <NOP>
nnoremap <bs> <NOP>
nnoremap <delete> <NOP>
inoremap <up> <NOP>
inoremap <down> <NOP>
inoremap <left> <NOP>
inoremap <right> <NOP>
nnoremap Q <NOP>
"}}}

" easy motion {{{
" jump to the next row on long lines
nnoremap j gj
nnoremap k gk
nnoremap gj 5j
nnoremap gk 5k
vnoremap j gj
vnoremap k gk
vnoremap gj 5j
vnoremap gk 5k

" when jump to next match also center screen
nnoremap n nzz
nnoremap N Nzz
vnoremap n nzz
vnoremap N Nzz
"}}}

" line bubbling {{{
nnoremap <C-Up>   :<C-u>silent! move-2<CR>==
nnoremap <C-Down> :<C-u>silent! move+<CR>==
xnoremap <C-Up>   :<C-u>silent! '<,'>move-2<CR>gv=gv
xnoremap <C-Down> :<C-u>silent! '<,'>move'>+<CR>gv=gv
" }}}

" cut/paste {{{
" more logical y (default was alias for yy)
nnoremap Y y$

" select text that was just pasted
noremap gV `[v`]

" keep selection highlighted while shifting text
xnoremap <  <gv
xnoremap >  >gv

" paste from system clipboard at current indentation
map <leader>p :set paste<CR>o<esc>"*]p:set nopaste<cr>
" }}}

" misc {{{

" quick ESC in insert mode
imap jk <ESC>

" quick fold toggle (suggestion from steve losh)
nnoremap , za

" use Ctrl+n to disable highlighted search terms
nmap <silent> <C-n> :noh<CR>

" fast(er) saving ?
nmap <leader>w :w!<cr>

" :W saves with sudo
command W w !sudo tee % > /dev/null

" paste mode toggling
nnoremap <silent> <F3> :set paste!<CR> :set paste?<CR>
" toggle spelling on and off
nnoremap <silent> <F4> :set spell!<CR> :set spell?<CR>
" source (reload configuration)
nnoremap <silent> <F5> :source $MYNVIMRC<CR>
"}}}

"}}}

map <F1> <del>
map! <F1> <del>

" vim: set sw=2 ts=2 et foldlevel=1 foldmethod=marker:
