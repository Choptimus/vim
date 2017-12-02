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
set wildmode=longest,list,full
set linebreak
set backspace=indent,eol,start
set winwidth=90
set directory=$HOME/.local/share/nvim/swap
set foldmethod=marker

" indentation options
set expandtab
set shiftwidth=4
set softtabstop=4

" Don't use ctags in autocomplete
set complete-=t

set nojoinspaces

" No annoying sound on errors
set noerrorbells
set novisualbell
set visualbell t_vb=

" Colors
set termguicolors
set background=dark
colorscheme onedark

" Splits
set splitbelow
set splitright

" Buffers
map <C-B> :CtrlPBuffer<CR>
map <C-L> :CtrlPTag<CR>
map <C-X> :bp\|bd #<CR>
map <C-J> :bp<CR>
map <C-K> :bn<CR>

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

" <!--- Additional NON-PORTABLE config ---!>
source $HOME/.vim/vimrc-local
