if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
 Plug 'airblade/vim-gitgutter'
 Plug 'godlygeek/tabular'
 Plug 'hashivim/vim-terraform'
 Plug 'huawenyu/vim-log-syntax'
 Plug 'jiangmiao/auto-pairs'
 Plug 'mbbill/undotree'
 Plug 'michaeljsmith/vim-indent-object'
 Plug 'morhetz/gruvbox'
 Plug 'pearofducks/ansible-vim'
 Plug 'python-mode/python-mode', { 'for': 'python' }
 Plug 'rodjek/vim-puppet'
 Plug 'sheerun/vim-polyglot'
 Plug 'tpope/vim-endwise'
 Plug 'tpope/vim-eunuch'
 Plug 'tpope/vim-fugitive'
 Plug 'tpope/vim-surround'
 Plug 'wellle/targets.vim'
call plug#end()

filetype plugin indent on

colorscheme gruvbox
let g:gruvbox_italic=1

syntax on

" spellchecking
set spelllang=pt,en

" enconding
set encoding=utf8

" highlight search pattern
set hlsearch

" do incremental search
set incsearch

" ignore case in the search pattern
set ignorecase

" search with regexp
set magic

" mouse
set mouse=a

" avoid paste errors
set pastetoggle=<F2>

" use backspace to delete text
set backspace=indent,start,eol

" use auto indentation
set autoindent
set smartindent

" dont user tab chars, use four spaces
set expandtab
set smarttab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set textwidth=80

" scrolling settings
set scrolloff=3
set sidescrolloff=7
set sidescroll=1

" don't make backup file
set nobackup
set nowb
set noswapfile

" the history size
set history=10000

"undoing time
set undofile
set undolevels=1000
set undoreload=10000

"last line info options
set showcmd

" show what mode you are in
set showmode

" cursor position info
set ruler

" show current line number and others relative
set number
set relativenumber

" confirm bash as shell
set shell=/bin/bash

"IgnoreCase, IncrementedSearch, SmartCaSe
set ignorecase incsearch smartcase

"ShowMatch
set showmatch
set matchtime=2

" auto complete in cmd mode
set wildmenu
set wildmode=full
set wildignore=*.swp,*.bak,*.pyc,*.class,*.o,*.un~

"speed boosters
set lazyredraw
set ttyfast

set termguicolors

" folding
set foldmethod=indent
set nofoldenable

"Always show the status line
set laststatus=2
"statusline
set statusline=   " clear the statusline for when vimrc is reloaded
set statusline+=%-3.3n\                      " buffer number
set statusline+=%f\                          " file name
set statusline+=%h%m%r%w                     " flags
set statusline+=[%{strlen(&ft)?&ft:'none'},  " filetype
set statusline+=%{strlen(&fenc)?&fenc:&enc}, " encoding
set statusline+=%{&fileformat}]              " file format
set statusline+=\ [%{getcwd()}] " current dir
set statusline+=%*
set statusline+=%=                           " right align
set statusline+=%b,0x%-8B\                   " current char
set statusline+=%-14.(%l,%c%V%)\ %<%P        " offset

let g:netrw_banner = 0

let g:terraform_align = 0
let g:terraform_fmt_on_save = 0
"

let g:pymode_rope = 0
let g:pymode_virtualenv = 1

nnoremap <F5> :UndotreeToggle<cr>

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

" move through split
nnoremap <C-H>  <C-w>h
nnoremap <C-L> <C-w>l
nnoremap <C-J>  <C-w>j
nnoremap <C-K> <C-w>k
" nmap <BS> <C-W>h

"neovim terminal
tnoremap <Esc> <C-\><C-n>
tnoremap <C-H> <C-\><C-n><C-w>h
tnoremap <C-L> <C-\><C-n><C-w>l
tnoremap <C-J> <C-\><C-n><C-w>j
tnoremap <C-K> <C-\><C-n><C-w>k

" save file using sudo
cnoremap w!! w !sudo tee %

"using grep on vim
nnoremap  <Leader>p :cp<CR>zz
nnoremap  <Leader>n :cn<CR>zz

"space include spaces
nnoremap <Space> i<Space><Esc>

"tab walking
nnoremap <left>  :tabprev<CR>
nnoremap <right> :tabnext<CR>
nnoremap <Leader>h :tabprev<CR>
nnoremap <Leader>l :tabnext<CR>

""buffer walking
nnoremap <Leader>k  :bn <CR>zz
nnoremap <Leader>j  :bp <CR>zz
nnoremap <up>    :bn <CR>zz
nnoremap <down>  :bp <CR>zz

"clean highlight search
nnoremap <C-c> <ESC>:nohlsearch<CR>

"Search
" faz os resultados da busca aparecerem no meio da tela
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

"Dir/files navigation
nnoremap <Leader>- :Explore<CR>
nnoremap <Leader>v- :Vexplore<CR>
nnoremap <Leader>s- :Sexplore<CR>
nnoremap <Leader>t- :Texplore<CR>
"Dir grep navigation
nnoremap <Leader>-/ :Explore **//
nnoremap <Leader>v-/ :Vexplore **//
nnoremap <Leader>s-/ :Sexplore **//
nnoremap <Leader>t-/ :Texplore **//

"split
nnoremap <Leader>v <C-w>v
nnoremap <Leader>s <C-w>s
nnoremap <Leader>t :tabnew %<CR> <C-o>

" textobj-line
nnoremap vil ^vg_

nnoremap <F9> :wa<CR>

"Color
hi Search ctermbg=green ctermfg=black
hi IncSearch ctermbg=black ctermfg=cyan
hi TabLineSel ctermfg=red ctermbg=grey
hi statusline guibg=Cyan ctermfg=6 guifg=Black ctermbg=0
hi MatchParen cterm=bold ctermbg=none ctermfg=3

autocmd BufNewFile,BufRead \*.{md,mdwn,mkd,mkdn,mark\*} set filetype=markdown
"
"Code block for markdown
autocmd FileType markdown let b:surround_45 = "```\n\r\n```"

"Block comment for python
autocmd FileType python let b:surround_45 = "\"\"\"\n\r\n\"\"\""

augroup BufWritePre_
  autocmd!
  autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
  autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
augroup END

augroup Filetype
  autocmd!
  autocmd FileType gitcommit set tw=72
augroup END

" Put these in an autocmd group, so that we can delete them easily.
augroup BufReadPost_
  au!
  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
augroup END

"Cria caminho completo do novo arquivo
function! s:MkNonExDir(file, buf)
  if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
    let dir=fnamemodify(a:file, ':h')
    if !isdirectory(dir)
      call mkdir(dir, 'p')
    endif
  endif
endfunction

" Strip trailing whitespace
function! <SID>StripTrailingWhitespaces()
  " Preparation save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  %s/\s\+$//e
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

function! VisualSelection(direction) range
  let l:saved_reg = @"
  execute "normal! vgvy"

  let l:pattern = escape(@", '\\/.*$^~[]')
  let l:pattern = substitute(l:pattern, "\n$", "", "")

  if a:direction == 'b'
    execute "normal ?" . l:pattern . "^M"
  elseif a:direction == 'gv'
    call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
  elseif a:direction == 'replace'
    call CmdLine("%s" . '/'. l:pattern . '/')
  elseif a:direction == 'f'
    execute "normal /" . l:pattern . "^M"
  endif

  let @/ = l:pattern
  let @" = l:saved_reg
endfunction

