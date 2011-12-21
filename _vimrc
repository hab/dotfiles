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

map <leader>f :CommandTFlush<cr>\|:CommandT<cr>
" Open files, limited to the directory of the current file, with <leader>gf
" This requires the %% mapping found below.
map <leader>gf :CommandTFlush<cr>\|:CommandT %%<cr>

map <leader>gv :CommandTFlush<cr>\|:CommandT app/views<cr>
map <leader>gc :CommandTFlush<cr>\|:CommandT app/controllers<cr>
map <leader>gm :CommandTFlush<cr>\|:CommandT app/models<cr>
map <leader>gh :CommandTFlush<cr>\|:CommandT app/helpers<cr>
map <leader>gl :CommandTFlush<cr>\|:CommandT lib<cr>
map <leader>gp :CommandTFlush<cr>\|:CommandT public<cr>
map <leader>gs :CommandTFlush<cr>\|:CommandT public/stylesheets<cr>

map <leader>gr :topleft :split config/routes.rb<cr>
map <leader>gg :topleft 100 :split Gemfile<cr>

cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%
map <leader>v :view %%

function! ShowRoutes()
  " Requires 'scratch' plugin
  :topleft 100 :split __Routes__
  " Make sure Vim doesn't write __Routes__ as a file
  :set buftype=nofile
  " Delete everything
  :normal 1GdG
  " Put routes output in buffer
  :0r! rake -s routes
  " Size window to number of lines (1 plus rake output length)
  :exec ":normal " . line("$") . "_ "
  " Move cursor to bottom
  :normal 1GG
  " Delete empty trailing line
  :normal dd
endfunction
map <leader>gR :call ShowRoutes()<cr>

map <leader>ew :e <C-R>=expand("%:p:h") . "/" <CR>
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
map <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>
cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

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
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

" Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC

  autocmd FileType ruby set omnifunc=rubycomplete#Complete
  autocmd FileType eruby set omnifunc=rubycomplete#Complete 
  autocmd FileType ruby let g:rubycomplete_buffer_loading=1
  autocmd FileType ruby let g:rubycomplete_classes_in_global=1
endif

nmap <leader>v :tabedit $MYVIMRC
