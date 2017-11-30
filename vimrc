" mandatory
execute pathogen#infect()
filetype plugin indent on
syntax on
set nu

" leader remap
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
set winwidth=90

if has('nvim')
    set directory=$HOME/.local/share/nvim/swap
endif

" set clipboard=unnamed
set foldmethod=marker

" statusline
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
set visualbell t_vb=

" no cursor styling
set guicursor=

" trying to stop the changing directory
if has('gui_macvim')
    set noautochdir
endif

" Properly disable sound on errors on MacVim
if has('gui_macvim')
    autocmd GUIEnter * set vb t_vb=
endif

" <!-- COLORS --!>

" color and styling options for macvim
if has('gui_macvim')
    set guifont=Source\ Code\ Pro\:h15
    set guioptions-=r
    set guioptions-=L
endif

if has('termguicolors')
    set termguicolors
    set background=dark
    colorscheme onedark
else
    set background=dark
    colorscheme shblah
endif

hi clear SignColumn

" <!-- HIGHLIGHTS --!>

" highlight for lines longer than 80 characters
highlight OverLength ctermbg=8 ctermfg=white guibg=darkgray guifg=white
match OverLength /\%80v/

" <!-- MISC KEY MAPPINGS --!>

" Splits
set splitbelow
set splitright

" Buffers
map <C-B> :CtrlPBuffer<CR>
map <C-L> :CtrlPTag<CR>
map <C-X> :bp\|bd #<CR>
map <C-J> :bp<CR>
map <C-K> :bn<CR>

" Get rid of search highlighting
nnoremap <CR> :nohlsearch<CR>

" Edit in the pwd
nmap <leader>ed :edit %:h/

" Deletes all trailing whitespace in a file
command Dat %s/\s\+$//

" CtrlP
let g:ctrlp_working_path_mode = 0
let g:ctrlp_follow_symlinks = 0
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)|\v[\/](node_modules|vendor|venv)',
  \ 'file': '\v\.(exe|so|dll|fls|log|aux|pdf|fdb_latexmk|pyc)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" Rainbow (mostly for clojure)
let g:rainbow_active = 0
autocmd BufRead *.clj,*.cljs RainbowToggleOn
" onedark gui colors
let g:rainbow_conf = {
  \ 'guifgs': ["#c678dd", "#61afef", "#98c379"],
  \ 'ctermfgs': ['magenta', 'blue', 'green'],
  \ }

let g:clojure_fuzzy_indent_patterns = [
  \ '^with', '^def', '^let', '^comment', '^loop', '^go-loop'
  \ ]

call neomake#configure#automake('nw')

" <!--- Additional NON-PORTABLE config ---!>
source $HOME/.vim/vimrc-local
