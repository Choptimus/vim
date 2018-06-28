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

if has('termguicolors')
    set termguicolors
endif
set background=dark
colorscheme onedark

let mapleader = ","
let maplocalleader = "\\"

map <c-x> :bp\|bd #<cr>
map <c-j> :bp<cr>
map <c-k> :bn<cr>
map <leader>ed :edit %:h/

autocmd VimResized * redraw!

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
map <c-b> :call FzyCommand('~/.vim/list-buffers ' . v:servername, ":e")<cr>
map <leader>t :call FzyCommand("cat tags \| awk '{print $1}' \| uniq", ":tag")<cr>

" Rainbow (mostly for clojure)
let g:rainbow_active = 0
autocmd BufRead *.clj,*.cljs,*.cljc,*.edn RainbowToggleOn
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
if filereadable('vimrc-local')
    source $HOME/.vim/vimrc-local
endif
