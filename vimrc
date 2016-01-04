" Pretty much mandatory

execute pathogen#infect()
filetype plugin indent on
syntax on
set nu

" Leader remap

let mapleader = ","
let g:mapleader = ","

" Recommended options

set hidden
set wildmenu
set wildmode=longest,list,full
set showcmd

set hlsearch " this got really annoying

" Usability options

set mouse=nicr
set backspace=indent,eol,start
set clipboard=unnamed
set laststatus=2
set autoindent
set nostartofline
set noshowmode

" Default indentation options, amend with ftplugins

set shiftwidth=4
set softtabstop=4
set expandtab

" Color options

set background=dark
colorscheme solarized

" Navigation

nmap <C-h> <C-w>h
nmap <C-l> <C-w>l

" neovim

" let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Minibufexplorer

map <C-d> :MBEbd<CR>
nnoremap <C-k> :MBEbn<CR>
nnoremap <C-j> :MBEbp<CR>

" split navigation
" things here

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>

" Syntastic

let g:syntastic_javascript_checkers = ['eslint']

" Airline

let g:airline_powerline_fonts = 1

" let g:airline#extensions#tabline#enabled = 1

" NERDTree

map <C-n> :NERDTreeToggle<CR>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Ctrl-P

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|vendor'

" highlight options

highlight OverLength ctermbg=darkgray ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" hard-time

let g:hardtime_default_on = 1

" Deletes all trailing whitespace in a file
command DelAllTrailing %s/\s\+$//

" Edit in the pwd
nmap <leader>ed :edit %:p:h/

" fugitive mappings
nmap <leader>gw :Gwrite<cr>
nmap <leader>gc :Gcommit<cr>
