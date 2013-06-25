set nocompatible
syntax on

call pathogen#infect()
runtime! macros/matchit.vim

scriptencoding utf-8

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


map <leader>gr :topleft :split config/routes.rb<cr>
map <leader>gg :topleft 100 :split Gemfile<cr>

cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%
map <leader>v :view %%

map <leader>ew :e <C-R>=expand("%:p:h") . "/" <CR>
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
map <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>
cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

" Use CTRL-S for saving, also in Insert mode
noremap <C-S>   :update<CR>
vnoremap <C-S>    <C-C>:update<CR>
inoremap <C-S>    <C-O>:update<CR>

command! W :w

filetype plugin indent on

filetype off
filetype on

nnoremap <F8> :setl noai nocin nosi inde=<CR>

map <Leader><Leader> :ZoomWin<CR>

" Minimal number of screen lines to keep above and below the cursor.
set scrolloff=3

" Use UTF-8.
set encoding=utf-8

colorscheme desert256
colorscheme desert
"colorscheme vividchalk

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

set title
set titlestring=VIM:\ %-25.55F\ %a%r%m titlelen=70

" Display incomplete commands.
set showcmd

" To save, press ctrl-s.
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>a

set hlsearch
set incsearch
set ignorecase
set smartcase

set wildmenu
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*/.idea/*,*/.bundle/*,*/log/*,tmp/cache/**

" Show editing mode
set showmode
" sm:    flashes matching brackets or parentheses
set showmatch

" Error bells are displayed visually.
set visualbell

augroup myfiletypes
  " Clear old autocmds in group
  autocmd!

  autocmd bufwritepost .vimrc source $MYVIMRC

  " autoindent with two spaces, always expand tabs
  autocmd FileType ruby,eruby,yaml set autoindent shiftwidth=2 softtabstop=2 tabstop=2 expandtab
  autocmd FileType python set autoindent shiftwidth=4 softtabstop=4 expandtab
  autocmd FileType javascript,html,htmldjango,css set autoindent shiftwidth=2 softtabstop=2 expandtab
  autocmd FileType vim set autoindent tabstop=2 shiftwidth=2 softtabstop=2 expandtab
  autocmd FileType cucumber set autoindent tabstop=2 shiftwidth=2 softtabstop=2 expandtab
  autocmd FileType puppet set autoindent tabstop=2 shiftwidth=2 softtabstop=2 expandtab
  au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab
  au BufRead,BufNewFile *etc/nginx/* set ft=nginx

  " treat rackup files like ruby
  au BufRead,BufNewFile *.ru set ft=ruby
  au BufRead,BufNewFile Gemfile set ft=ruby
  autocmd BufEnter *.haml setlocal cursorcolumn
  au BufRead,BufNewFile Gemfile set ft=ruby
  au BufRead,BufNewFile Capfile set ft=ruby
  au BufRead,BufNewFile Thorfile set ft=ruby
  au BufRead,BufNewFile *.god set ft=ruby
  au BufRead,BufNewFile .caprc set ft=ruby
augroup END

" Turn on language specific omnifuncs
autocmd FileType ruby set omnifunc=rubycomplete#Complete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

" have some fun with bufexplorer
let g:bufExplorerDefaultHelp=0       " Do not show default help.
let g:bufExplorerShowRelativePath=1  " Show relative paths.

nmap <leader>v :tabedit $MYVIMRC

" limit number of results shown for performance
let g:fuzzy_matching_limit=60
" ignore stuff that can't be openned, and generated files
let g:fuzzy_ignore = "*.png;*.PNG;*.JPG;*.jpg;*.GIF;*.gif;*.beam;vendor/**;coverage/**;tmp/**;rdoc/**"
" increate the number of files scanned for very large projects
let g:fuzzy_ceiling=20000
" display relative path, instead of abbrevated path (lib/jeweler.rb vs l/jeweler.rb)
let g:fuzzy_path_display = 'relative_path'

let g:browser = 'open '

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal g`\"" |
      \ endi

map <leader>F :Ack<space>

" Hide search highlighting
map <silent> <leader>nh :nohls <CR>

map <leader>n :NERDTreeToggle<CR>
" quit NERDTree after openning a file
let NERDTreeQuitOnOpen=1
" colored NERD Tree
let NERDChristmasTree = 1
let NERDTreeHighlightCursorline = 1
let NERDTreeShowHidden = 1

" map enter to activating a node
" let NERDTreeMapActivateNode='<CR>'
let NERDTreeIgnore=['\.git','\.DS_Store','\.pdf', '.beam', '\.bundle']


