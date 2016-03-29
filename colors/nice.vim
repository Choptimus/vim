"
" jsch's vim colorscheme
"

au InsertEnter * hi StatusLine cterm=NONE ctermbg=lightgray ctermfg=black
au InsertLeave * hi StatusLine cterm=NONE ctermbg=black ctermfg=NONE

hi CursorLine cterm=bold ctermbg=black
hi CursorColumn cterm=NONE ctermbg=black
hi CursorLineNr cterm=bold ctermbg=black ctermfg=white
hi LineNr ctermfg=lightgray
hi NonText ctermfg=black
hi StatusLine cterm=NONE ctermbg=black ctermfg=NONE

let g:colors_name='nice'

set bg=dark
