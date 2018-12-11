execute pathogen#infect()

set nocompatible

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

map <leader>ed :edit %:h
map <F4> :nohl<cr>

autocmd VimResized * redraw!

" Deletes all trailing whitespace in a file
map <leader>d :%s/\s\+$//<cr>

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

" fzy
function! FzyCommand(choice_command, vim_command) abort
    let l:callback = {
                \ 'window_id': win_getid(),
                \ 'filename': tempname(),
                \ 'vim_command': a:vim_command
                \ }

    function! l:callback.on_exit(job_id, data, event) abort
        bdelete!
        call win_gotoid(self.window_id)
        if filereadable(self.filename)
            try
                let l:selected_filename = readfile(self.filename)[0]
                exec self.vim_command . ' ' . l:selected_filename
            catch /E684/
            endtry
        endif
        call delete(self.filename)
    endfunction

    botright 10 new
    let l:term_command = a:choice_command . ' | fzy > ' .  l:callback.filename
    silent call termopen(l:term_command, l:callback)
    setlocal nonumber norelativenumber
    startinsert
endfunction

if executable('ag')
    map <c-p> :call FzyCommand("ag . --silent -l -g ''", ":e")<cr>
else
    map <c-p> :call FzyCommand("find -type f", ":e")<cr>
endif
map <leader>t :call FzyCommand("cat tags \| awk '{print $1}' \| uniq", ":tag")<cr>

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

" Additional NON-PORTABLE config
if filereadable('vimrc-local')
    source $HOME/.vim/vimrc-local
endif
