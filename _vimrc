set nocompatible
syntax on

call pathogen#runtime_append_all_bundles()
runtime! macros/matchit.vim

" set nowrap
set tabstop=2
set smarttab
set shiftwidth=2
set softtabstop=2
set autoindent
set expandtab
set backspace=start,indent
set number
set ruler
set list listchars=tab:\ \ ,trail:.

set backspace=indent,eol,start

let mapleader = ","

" Set up commands for FuzzyFinder and FuzzyFinderTextMate
map <leader>g :FuzzyFinderTextMate<CR>
map <leader>d :FuzzyFinderBuffer<CR>
map <leader>f :FuzzyFinderFile<CR>
map <leader>r :FuzzyFinderMruFile<CR>
map <leader>R :ruby finder.rescan!<CR>:FuzzyFinderRenewCache<CR>:exe ":echo 'rescan complete'"<CR>

map <leader>ew :e <C-R>=expand("%:p:h") . "/" <CR>

map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
map <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>
cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

" Set up command for NERDTree
map <leader>n :NERDTreeToggle<CR>

command! W :w

filetype plugin indent on

filetype off
filetype on

nnoremap <F8> :setl noai nocin nosi inde=<CR>

map <Leader><Leader> :ZoomWin<CR>

" Minimal number of screen lines to keep above and below the cursor.
set scrolloff=2 

" Use UTF-8.
set encoding=utf-8

"colorscheme desert256
colorscheme vividchalk

" Status line
set laststatus=2 
set statusline= 
set statusline+=%-3.3n\ 
set statusline+=%f\ 
set statusline+=%h%m%r%w 
set statusline+=\[%{strlen(&ft)?&ft:'none'}] 
set statusline+=%= 
set statusline+=0x%-8B 
set statusline+=%-14(%l,%c%V%) 
set statusline+=%<%P

" Display incomplete commands.
set showcmd

" To insert timestamp, press F3.
nmap <F3> a<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc> 
imap <F3> <C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>

" To save, press ctrl-s.
nmap <c-s> :w<CR> 
imap <c-s> <Esc>:w<CR>a

set hlsearch
set incsearch
set ignorecase
set smartcase

set wildmenu
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc

" Show editing mode
set showmode

" Error bells are displayed visually.
set visualbell

" Omni Completion
" *************************************************************
autocmd FileType html :set omnifunc=htmlcomplete#CompleteTags
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

" May require ruby compiled in
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete 

" Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

nmap <leader>v :tabedit $MYVIMRC
