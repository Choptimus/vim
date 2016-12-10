" Mandatory
execute pathogen#infect()
filetype plugin indent on
syntax on
set nu

" Leader remap
let mapleader = ","
let maplocalleader = "\\"
let g:mapleader = ","

set hidden
set wildmenu
set wildmode=longest,list,full
set showcmd
set linebreak
set hlsearch
set backspace=indent,eol,start

" set clipboard=unnamed
set fdm=marker

" Statusline
set laststatus=2
set ruler
set showmode

" indentation options
set autoindent
set nostartofline
set shiftwidth=4
set softtabstop=4
set expandtab

" Don't use ctags in autocomplete
set cpt-=t

set nojoinspaces

" If a file is changed outside of vim, automatically reload it without asking
set autoread

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=

" Properly disable sound on errors on MacVim
if has("gui_macvim")
    autocmd GUIEnter * set vb t_vb=
endif

" <!-- COLORS --!>

set background=dark
" color and styling options for macvim
if has("gui_macvim")
    colorscheme cloudy-gui

    set guifont=Source\ Code\ Pro\:h15
    set guioptions-=r
    set guioptions-=L
elseif has ('nvim')
    " let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    colorscheme shblah
else
    colorscheme shblah
endif

" <!-- HIGHLIGHTS --!>

" highlight for lines longer than 80 characters
highlight OverLength ctermbg=darkgray ctermfg=white guibg=darkgray guifg=white

" highlights just the 81st column
match OverLength /\%81v/

" <!-- MISC KEY MAPPINGS --!>

" Saving and quitting
noremap <leader>w :write<CR>
noremap <leader>q :quit<CR>
noremap <leader>x :wq<CR>

" Splits
set splitbelow
set splitright

map <leader>h <C-w>h
map <leader>l <C-w>l

" Buffers
map <F1> :ls<cr>
map <C-b> :CtrlPBuffer<cr>
map <C-l> :CtrlPBufTag<cr>
map <C-x> :bp\|bd #<cr>
map <C-j> :bp<cr>
map <C-k> :bn<cr>

" Get rid of search highlighting
nnoremap <cr> :nohlsearch<CR>

" Edit in the pwd
nmap <leader>ed :edit %:p:h/

" Fugitive mappings
nmap <leader>gw :Gwrite<cr>
nmap <leader>gc :Gcommit<cr>

" Deletes all trailing whitespace in a file
command DelAllTrailing %s/\s\+$//

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGINS "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" <!--- HARDTIME ---!>
let g:hardtime_default_on = 0
let g:hardtime_ignore_quickfix = 1
let g:hardtime_allow_different_key = 1

" <!--- SYNTASTIC ---!>
let g:syntastic_javascript_checkers = ['eslint']

" <!-- CTRL-P ---!>
let g:ctrlp_follow_symlinks = 0
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)|\v[\/](node_modules|vendor)$\|/media',
  \ 'file': '\v\.(exe|so|dll|fls|log|aux|pdf|fdb_latexmk)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" <!-- PHP --!>
let php_var_selector_is_identifier = 1

" <!--- Additional NON-PORTABLE config ---!>
source $HOME/.vim/vimrc-local

" <!--- Fugitive ---!>
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
