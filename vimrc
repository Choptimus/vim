execute pathogen#infect()

set nocompatible

runtime macros/matchit.vim

" These are nvim defaults that are not defaults in vim
filetype plugin indent on
syntax on
set autoindent
set smarttab
set backspace=indent,eol,start
set ruler
set autoread
set laststatus=2
set hlsearch
set wildmenu

set path+=**
set hidden
set linebreak
set winwidth=90
set foldmethod=marker
set splitbelow
set splitright
set complete-=it
set guicursor=
set showtabline=0

set expandtab
set shiftwidth=4
set softtabstop=4

if has('termguicolors')
    set termguicolors
    set background=dark
    colorscheme onedark
endif

let mapleader = ","
let maplocalleader = "\\"

set wildcharm=<C-z>
nnoremap <Leader>e :edit **/*<C-z><S-Tab>
nnoremap <leader>h :edit %:h
nnoremap <Leader>f :find **/*<C-z><S-Tab>
nnoremap <F4> :nohl<cr>

autocmd VimResized * redraw!

" Deletes all trailing whitespace in a file
nnoremap <leader>d :%s/\s\+$//<cr>

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
nnoremap <leader>n :call RenameFile()<cr>

" Rainbow (mostly for clojure)
let g:rainbow_active = 0
autocmd BufRead,BufNewFile *.clj,*.cljs,*.cljc,*.edn,*.scm,*.lisp RainbowToggleOn
let g:rainbow_conf = {
  \ 'guifgs': ["#c678dd", "#61afef", "#98c379"],
  \ 'ctermfgs': ['magenta', 'blue', 'green'],
  \ }

" clojure syntax settings
let g:clojure_fuzzy_indent_patterns = [
  \ '^with', '^def', '^let', '^comment', '^loop', '^go-loop', 'while', 'reg-sub'
  \ ]
let g:clojure_align_subforms = 1

let g:ale_lint_on_text_changed = 'never'
