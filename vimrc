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

set foldmethod=marker

set laststatus=2

set autoindent
set nostartofline
set showmode

" Default indentation options, amend with ftplugins

set shiftwidth=4
set softtabstop=4
set expandtab

" Color options

" let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set background=dark
let base16colorspace=256
colorscheme base16-ocean

" Navigation

map <leader>h <C-w>h
map <leader>l <C-w>l
map <F1> :ls<CR>
map <C-b> :ls<CR>:b<Space>

" Minibufexplorer

map <C-i> :bd<CR>
nnoremap <C-k> :bn<CR>
nnoremap <C-j> :bp<CR>

" split navigation
" things here

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>

" Syntastic

let g:syntastic_javascript_checkers = ['eslint']

" NERDTree

map <C-n> :NERDTreeToggle<CR>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Ctrl-P
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|vendor'

" highlight options

highlight OverLength ctermbg=darkgray ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" hard-time

let g:hardtime_default_on = 1
let g:hardtime_ignore_quickfix = 1
let g:hardtime_allow_different_key = 1

" Deletes all trailing whitespace in a file
command DelAllTrailing %s/\s\+$//


" php syntax config
let php_var_selector_is_identifier = 1

function! PhpSyntaxOverride()
endfunction

augroup phpSyntaxOverride
    autocmd!
    autocmd FileType php call PhpSyntaxOverride()
augroup END

" background color erase then redraw
set t_ut=

"<!--- MAPPINGS --!>"

" saving and quitting
noremap <leader>w :write<CR>
noremap <leader>q :quit<CR>
noremap <leader>x :wq<CR>
" comma command was clobbered by leader so remap it
noremap ' ,
" edit in the pwd
nmap <leader>ed :edit %:p:h/
" fugitive mappings
nmap <leader>gw :Gwrite<cr>
nmap <leader>gc :Gcommit<cr>
