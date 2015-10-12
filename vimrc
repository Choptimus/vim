" Pretty much mandatory

execute pathogen#infect()
filetype plugin indent on
syntax on
set nu

" Recommended options

set hidden
set wildmenu
set wildmode=longest,list,full
set showcmd
" set hlsearch " this got really annoying

" Usability options

set mouse=nicr
set backspace=indent,eol,start
set clipboard=unnamed
set laststatus=2
set autoindent
set nostartofline
set noshowmode

" Indentation options

set shiftwidth=4
set softtabstop=4
set expandtab

" Color options

set background=dark
colorscheme jellybeans

" {--KEY MAPPINGS--}

" Minibufexplorer

map <C-d> :MBEbd<CR>
nnoremap <C-k> :MBEbn<CR>
nnoremap <C-j> :MBEbp<CR>

" split navigation
" things here

" {--COMMANDS--}

command DelAllTrailing %s/\s\+$//

" {--PLUGINS--}

" Syntastic

let g:syntastic_javascript_checkers = ['eslint']

" Airline

let g:airline_powerline_fonts = 1

" let g:airline#extensions#tabline#enabled = 1

" NERDTree

map <C-n> :NERDTreeToggle<CR>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

:command! -nargs=1 -range SuperRetab <line1>,<line2>s/\v%(^ *)@<= {<args>}/\t/g

" Ctrl-P

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|vendor'

" highlight options

highlight OverLength ctermbg=darkgray ctermfg=white guibg=#592929
match OverLength /\%81v.\+/
