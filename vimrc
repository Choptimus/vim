set nocompatible

runtime macros/matchit.vim

augroup mygroup
    autocmd!
augroup END

filetype plugin indent on
syntax on
set autoindent
set expandtab
set shiftwidth=4
set softtabstop=4
set smarttab
set backspace=indent,eol,start
set ruler
set autoread
set laststatus=1
set hlsearch
set incsearch
set wildmenu
set showcmd
set hidden
set linebreak
set foldmethod=marker
set splitbelow
set splitright
set complete-=it
set guicursor=
set showtabline=0

if has("nvim")
    set inccommand=nosplit
    set wildoptions-=pum
else
    if empty($XDG_DATA_HOME)
        let $XDG_DATA_HOME = $HOME . "/.local/share"
    endif

    if isdirectory($XDG_DATA_HOME . "/vim/swap/")
        set directory=$XDG_DATA_HOME/vim/swap//
    endif

    if isdirectory($XDG_DATA_HOME . "/vim/undo/")
        set undofile
        set undodir=$XDG_DATA_HOME/vim/undo/
    endif

    runtime ftplugin/man.vim
    set keywordprg=:Man
endif

if has("termguicolors")
    set termguicolors
    colorscheme lake
endif

let mapleader = ","
let maplocalleader = "\<Space>"

set wildcharm=<C-z>
nnoremap <Leader>e :edit **/*<C-z><S-Tab>
nnoremap <Leader>f :find **/*<C-z><S-Tab>
nnoremap <Leader>h :edit %:h<C-z>
nnoremap <Leader>b :ls<CR>:b<Space>
nnoremap <Leader>t :tabs<CR>:tabn<Space>
nnoremap <Leader>m :make<CR>:cwindow<CR>:cc<CR><ESC>
nnoremap <Leader>a :cp<CR>
nnoremap <Leader>s :cn<CR>
nnoremap <Leader>q :cc<CR>

nnoremap <F4> :nohl<CR>

" Deletes all trailing whitespace in a file
nnoremap <Leader>d :%s/\s\+$//<CR>

" Renames the current file
function! RenameFile()
    let old_name = expand("%")
    let new_name = input("New file name: ", expand("%"), "file")
    if new_name != "" && new_name != old_name
        exec ":saveas " . new_name
        exec ":silent !rm " . old_name
        redraw!
    endif
endfunction
nnoremap <Leader>n :call RenameFile()<CR>

if has("mac")
    set path-=/usr/include
    let &path .= "," . system("xcrun --show-sdk-path | tr -d '\n'") . "/usr/include"
endif

let g:clojure_fuzzy_indent_patterns = [
  \ "^with", "^def", "^let", "^comment", "^loop", "^go-loop", "^while",
  \ "^reg-sub", "^do", "^try", "^cond"
  \ ]
let g:clojure_align_subforms = 1

let g:ale_lint_on_text_changed = "never"
nnoremap <F5> :ALEToggleBuffer<CR>

let g:netrw_banner = 0

nnoremap <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

autocmd mygroup BufNewFile,BufRead todo-work.txt set filetype=todo
