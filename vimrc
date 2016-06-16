" Pretty much mandatory

execute pathogen#infect()
filetype plugin indent on
syntax on
set nu

" Leader remap

let mapleader = ","
let maplocalleader = "\\"
let g:mapleader = ","

" Recommended options

set hidden
set wildmenu
set wildmode=longest,list,full
set showcmd
set linebreak " break on lines but not words

set hlsearch " this got really annoying

" Usability options

set mouse=nicr
set backspace=indent,eol,start
" set clipboard=unnamed

set foldmethod=marker

set laststatus=2
set ruler

set autoindent
set nostartofline
set showmode

" Default indentation options, amend with ftplugins

set shiftwidth=4
set softtabstop=4
set expandtab

" Autocompletion
" Don't use ctags in autocomplete
set cpt-=t

" <!--- COLORS ---!>

set background=dark
if has ('nvim')
    " can cause issues with non-gui themes
    " let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    set t_Co=256
    colorscheme shblah
else
    colorscheme shblah
endif

" <!-- HIGHLIGHTS --!>

" highlight for lines longer than 80 characters
highlight OverLength ctermbg=darkgray ctermfg=white guibg=#592929

" highlights all columns after the 80th column
" match OverLength /\%81v.\+/

" highlights just the 81st column
match OverLength /\%81v/

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
map <C-x> :bd<cr>
map <C-j> :bp<cr>
map <C-k> :bn<cr>

" Redraws the screen and removes any search highlighting.
nnoremap <silent> <leader>l :nohl<CR>

" Comma command was clobbered by leader so remap it
noremap ' ,

" Edit in the pwd
nmap <leader>ed :edit %:p:h/

" Fugitive mappings
nmap <leader>gw :Gwrite<cr>
nmap <leader>gc :Gcommit<cr>

" Deletes all trailing whitespace in a file
command DelAllTrailing %s/\s\+$//

" | PLUGINS |

" <!--- HARDTIME ---!>
let g:hardtime_default_on = 0
let g:hardtime_ignore_quickfix = 1
let g:hardtime_allow_different_key = 1

" <!--- SYNTASTIC ---!>
let g:syntastic_javascript_checkers = ['eslint']

" <!-- CTRL-P ---!>
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)|\v[\/](node_modules|vendor)$\|/media',
  \ 'file': '\v\.(exe|so|dll|fls|log|aux|pdf|fdb_latexmk)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" <!-- PHP --!>
let php_var_selector_is_identifier = 1

" <!--- Additional NON-PORTABLE config ---!>
source $HOME/.vim/vimrc-local
