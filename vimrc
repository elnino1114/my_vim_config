" pathogen start
call pathogen#runtime_append_all_bundles()
" pathogen end

" vundle start
set nocompatible              " be iMproved
filetype on                 " required!
filetype plugin on

set rtp+=~/.vim/vundle
call vundle#rc()

" Map leader and localleader key to comma
 let mapleader = ","
 let g:mapleader = ","
 let maplocalleader = ","
 let g:maplocalleader = ","

Bundle 'DavidEGx/ctrlp-smarttabs'
Bundle 'https://github.com/kien/ctrlp.vim.git'
Bundle 'git://github.com/majutsushi/tagbar'
Bundle 'https://github.com/scrooloose/nerdtree.git'
Bundle 'vim-scripts/tComment'                          
Bundle 'tpope/vim-abolish'                             
Bundle 'sjl/gundo.vim'                                 
Bundle "Lokaltog/vim-easymotion"
Bundle "tpope/vim-surround"
Bundle "bling/vim-airline"
Bundle 'rking/ag.vim'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'altercation/vim-colors-solarized'
Bundle 'tpope/vim-repeat'
Bundle 'yegappan/mru'                                  
" for markdown preview
Bundle 'shime/vim-livedown'
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set hidden
" for help
set wildmenu
set wildmode=longest:full,full
" set wildmode=list:longest,full

set nofoldenable
set nu
set hlsearch
" Clear the last hlsearch results
nnoremap <F4> :let @/ = ""<CR>
set incsearch
set ignorecase
set smartcase
set autoindent
set pastetoggle=<F6>
set grepprg=ag
syntax enable
set background=dark
colorscheme desert

let g:solarized_termcolors=256
nnoremap <silent> <leader>2 :TagbarToggle<CR>
let g:tagbar_left = 1
let g:tagbar_width = 33
let g:tagbar_autoshowtag = 1
let NERDTreeWinPos = 1

let tags = "./tags"
nnoremap <silent> <leader><tab> :NERDTreeToggle<CR>
nnoremap <F3> :CtrlPSmartTabs<CR>
" instead of commandT buffer windows
nnoremap <leader>b :CtrlPBuffer<CR>
" search from buffer. a little different from CtrlPBuffer

" Q: Closes the window
nnoremap Q :q<cr>
" close all windows
nnoremap <leader>Q :qa!<cr>

" Ctrl-r: Easier search and replace
vnoremap <c-r> "hy:%s/<c-r>h//gc<left><left><left>

if has("autocmd")
  filetype on
  autocmd FileType python setlocal ts=4 sts=4 sw=4 et
  autocmd FileType cc setlocal ts=2 sts=2 sw=2 et
  autocmd FileType cpp setlocal ts=2 sts=2 sw=2 et
  autocmd FileType c setlocal ts=4 sts=4 sw=4 et
  autocmd FileType shell setlocal ts=4 sts=4 sw=4 et
  autocmd FileType java setlocal ts=4 sts=4 sw=4 et
  autocmd FileType php setlocal ts=4 sts=4 sw=4 et
endif

" MRU mapping
nnoremap <leader>M :MRU<CR>

" Gundo mapping and settings
nnoremap <F5> :GundoToggle<CR>
let g:gundo_width = 60
let g:gundo_preview_height = 25
let g:gundo_right = 1

" copy
set clipboard+=unnamed

" easy move between tabs
map <leader>n <esc>:tabprevious<cr>
map <leader>m <esc>:tabnext<cr>

" easy move around windows
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
set timeoutlen=500

" sort
vnoremap <leader>s :sort<cr>

" easy move code blocks
vnoremap < <gv 
vnoremap > >gv 

nnoremap <c-e> 3<c-e>
nnoremap <c-y> 3<c-y>

" pairs
inoremap <leader>" ""<ESC>i
inoremap <leader>' ''<ESC>i
inoremap <leader>[ []<ESC>i
inoremap <leader>( ()<ESC>i

set cursorline
set backspace=indent,eol,start

"
"inoremap maps a key combination for insert mode
"<C-e> is the keybinding I am creating.
"<C-o> is a command that switches vim to normal mode for one command.
"$ jumps to the end of the line and we are switched back to insert mode.
inoremap <C-e> <C-o>$
inoremap <C-a> <C-o>0

" Navigating in Command Mode
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-f> <Right>
cnoremap <C-b> <Left>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>

" Don't update the display while executing macros! speed up! Oh~Oh~
set lazyredraw

" Show the current command in the lower right corner
set showcmd

" Edit and Source vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

set laststatus=2
" vim-airline
set t_Co=256
set laststatus=2 " show statusline all time
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#fnamemod = ':t' " only show buffer name
let g:airline_theme = "dark"
" vim-livedown start
" should markdown preview get shown automatically upon opening markdown buffer
let g:livedown_autorun = 0
" should the browser window pop-up upon previewing
let g:livedown_open = 1
" the port on which Livedown server will run
let g:livedown_port = 1337
nmap <leader>md :LivedownPreview<CR>
" vim-livedown end
