execute pathogen#infect()
filetype plugin indent on
syntax on

set number
set hidden
set wildmode=longest,list,full
set linebreak
set backspace=indent,eol,start
set winwidth=90
set directory=$HOME/.local/share/vim/swap
set foldmethod=marker
set nojoinspaces
set splitbelow
set splitright
set expandtab
set shiftwidth=4
set softtabstop=4
set complete-=t
set hlsearch
set laststatus=2
set showcmd
set guicursor=
set termguicolors
set background=dark
colorscheme onedark

let mapleader = ","
let maplocalleader = "\\"

map <c-x> :bp\|bd #<cr>
map <c-j> :bp<cr>
map <c-k> :bn<cr>
map <leader>ed :edit %:h/

" Deletes all trailing whitespace in a file
function! DeleteTrailingWhiteSpace()
    exec ':%s/\s\+$//'
    exec ':nohlsearch'
endfunction
map <leader>d :call DeleteTrailingWhiteSpace()<cr>

" Renames the current file
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>n :call RenameFile()<cr>

" CtrlP
map <c-b> :CtrlPBuffer<cr>
map <leader>t :CtrlPTag<cr>
let g:ctrlp_working_path_mode = 0
let g:ctrlp_follow_symlinks = 0
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)|\v[\/](node_modules|vendor|venv|build|dist|target)',
  \ 'file': '\v\.(exe|o|so|dll|fls|log|aux|pdf|fdb_latexmk|pyc)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" Rainbow (mostly for clojure)
let g:rainbow_active = 0
autocmd BufRead *.clj,*.cljs RainbowToggleOn
let g:rainbow_conf = {
  \ 'guifgs': ["#c678dd", "#61afef", "#98c379"],
  \ 'ctermfgs': ['magenta', 'blue', 'green'],
  \ }

" clojure syntax settings
let g:clojure_fuzzy_indent_patterns = [
  \ '^with', '^def', '^let', '^comment', '^loop', '^go-loop', 'while'
  \ ]

let g:ale_lint_on_text_changed = 'never'

" Additional NON-PORTABLE config
source $HOME/.vim/vimrc-local
