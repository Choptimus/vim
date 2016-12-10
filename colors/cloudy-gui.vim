" ┏━┓╻ ╻┏┓ ╻  ┏━┓╻ ╻   ╻ ╻╻┏┳┓
" ┗━┓┣━┫┣┻┓┃  ┣━┫┣━┫   ┃┏┛┃┃┃┃
" ┗━┛╹ ╹┗━┛┗━╸╹ ╹╹ ╹ ╹ ┗┛ ╹╹ ╹
"                           -- by z3bra
" =====================================
"
" A 16 colors scheme that use your terminal colors

set background=dark
if version > 580
    highlight clear
    if exists("g:syntax_on")
        syntax reset
    endif
endif
let g:colors_name="shblah_orig"

" Actual colours and styles.
highlight CursorLine   term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE
highlight ColorColumn  term=NONE cterm=NONE ctermfg=NONE ctermbg=3 guifg=#273941 guibg=#a6a663
highlight Comment      term=NONE cterm=NONE ctermfg=8 ctermbg=NONE guifg=#456472 guibg=#273941
highlight Constant     term=NONE cterm=NONE ctermfg=6 ctermbg=NONE guifg=#63a69b guibg=#273941
highlight Cursor       term=NONE cterm=bold ctermfg=3 ctermbg=NONE guibg=#c0c5ce
highlight DiffAdd      term=NONE cterm=bold ctermfg=2 ctermbg=NONE guifg=#63a690 guibg=#273941
highlight DiffChange   term=NONE cterm=bold ctermfg=NONE ctermbg=NONE guifg=#273941 guibg=#273941
highlight DiffDelete   term=NONE cterm=bold ctermfg=7 ctermbg=1 guifg=#c0c5ce guibg=#a66363
highlight DiffText     term=NONE cterm=bold ctermfg=7 ctermbg=4 guifg=#c0c5ce guibg=#6385a6
highlight Directory    term=NONE cterm=bold ctermfg=4 ctermbg=0 guifg=#6385a6 guibg=#273941
highlight Error        term=NONE cterm=NONE ctermfg=0 ctermbg=1 guifg=#273941 guibg=#a66363
highlight ErrorMsg     term=NONE cterm=bold ctermfg=1 ctermbg=0 guifg=#a66363 guibg=#273941
highlight FoldColumn   term=NONE cterm=bold ctermfg=0 ctermbg=NONE guifg=#273941 guibg=#273941
highlight Folded       term=NONE cterm=bold ctermfg=0 ctermbg=NONE guifg=#273941 guibg=#273941
highlight Function     term=NONE cterm=bold ctermfg=5 ctermbg=NONE guifg=#bf9c86 guibg=#273941
highlight Identifier   term=NONE cterm=NONE ctermfg=1 ctermbg=NONE guifg=#a66363 guibg=#273941
highlight IncSearch    term=NONE cterm=bold ctermfg=5 ctermbg=5 guifg=#bf9c86 guibg=#bf9c86
highlight NonText      term=NONE cterm=bold ctermfg=8 ctermbg=NONE guifg=#456472 guibg=#273941
highlight Normal       term=NONE cterm=NONE ctermfg=7 ctermbg=NONE guifg=#c0c5ce guibg=#273941
highlight Pmenu        term=NONE cterm=NONE ctermfg=0 ctermbg=7 guifg=#273941 guibg=#c0c5ce
highlight PreProc      term=NONE cterm=bold ctermfg=6 ctermbg=NONE guifg=#63a69b guibg=#273941
highlight Search       term=NONE cterm=bold ctermfg=7 ctermbg=5 guifg=#c0c5ce guibg=#bf9c86
highlight Special      term=NONE cterm=NONE ctermfg=2 ctermbg=NONE guifg=#63a690 guibg=#273941
highlight SpecialKey   term=NONE cterm=NONE ctermfg=0 ctermbg=NONE guifg=#273941 guibg=#273941
highlight Statement    term=NONE cterm=NONE ctermfg=4 ctermbg=NONE guifg=#6385a6 guibg=#273941
highlight StatusLine   term=NONE cterm=bold ctermfg=8 ctermbg=NONE guifg=#a66363 guibg=#456472
highlight StatusLineNC term=NONE cterm=bold ctermfg=0 ctermbg=NONE guifg=#273941 guibg=#456472
highlight String       term=NONE cterm=NONE ctermfg=2 ctermbg=NONE guifg=#63a690 guibg=#273941
highlight TabLineSel   term=NONE cterm=bold ctermfg=7 ctermbg=NONE guifg=#c0c5ce guibg=#273941
highlight Todo         term=NONE cterm=bold ctermfg=7 ctermbg=1 guifg=#c0c5ce guibg=#a66363
highlight Type         term=NONE cterm=bold ctermfg=4 ctermbg=NONE guifg=#6385a6 guibg=#273941
highlight Underlined   term=underline cterm=underline ctermfg=NONE ctermbg=NONE guifg=#273941 guibg=#273941
highlight VertSplit    term=NONE cterm=bold ctermfg=0 ctermbg=NONE guifg=#273941 guibg=#273941
highlight Visual       term=NONE cterm=NONE ctermfg=0 ctermbg=8 guifg=#273941 guibg=#456472
highlight WarningMsg   term=NONE cterm=bold ctermfg=3 ctermbg=NONE guifg=#a6a663 guibg=#273941

" General highlighting group links.
highlight! link diffAdded       DiffAdd
highlight! link diffRemoved     DiffDelete
highlight! link diffChanged     DiffChange
highlight! link StatusLine      StatusLineNC
highlight! link Title           Normal
highlight! link LineNr          NonText
highlight! link MoreMsg         Normal
highlight! link Question        DiffChange
"highlight! link TabLine         StatusLineNC
"highlight! link TabLineFill     StatusLineNC
highlight! link VimHiGroup      VimGroup

" Test the actual colorscheme
syn match Comment      "\"__Comment.*"
syn match Constant     "\"__Constant.*"
syn match Cursor       "\"__Cursor.*"
syn match CursorLine   "\"__CursorLine.*"
syn match DiffAdd      "\"__DiffAdd.*"
syn match DiffChange   "\"__DiffChange.*"
syn match DiffText     "\"__DiffText.*"
syn match DiffDelete   "\"__DiffDelete.*"
syn match Folded       "\"__Folded.*"
syn match Function     "\"__Function.*"
syn match Identifier   "\"__Identifier.*"
syn match IncSearch    "\"__IncSearch.*"
syn match NonText      "\"__NonText.*"
syn match Normal       "\"__Normal.*"
syn match Pmenu        "\"__Pmenu.*"
syn match PreProc      "\"__PreProc.*"
syn match Search       "\"__Search.*"
syn match Special      "\"__Special.*"
syn match SpecialKey   "\"__SpecialKey.*"
syn match Statement    "\"__Statement.*"
syn match StatusLine   "\"__StatusLine.*"
syn match StatusLineNC "\"__StatusLineNC.*"
syn match String       "\"__String.*"
syn match Todo         "\"__Todo.*"
syn match Type         "\"__Type.*"
syn match Underlined   "\"__Underlined.*"
syn match VertSplit    "\"__VertSplit.*"
syn match Visual       "\"__Visual.*"

"__Comment              /* this is a comment */
"__Constant             var = SHBLAH
"__Cursor               char under the cursor?
"__CursorLine           Line where the cursor is
"__DiffAdd              +line added from file.orig
"__DiffChange           line changed from file.orig
"__DiffText             actual changes on this line
"__DiffDelete           -line removed from file.orig
"__Folded               +--- 1 line : Folded line ---
"__Function             function sblah()
"__Identifier           Never ran into that actually...
"__IncSearch            Next search term
"__NonText              This is not a text, move on
"__Normal               Typical text goes like this
"__Pmenu                Currently selected menu item
"__PreProc              #define SHBLAH true
"__Search               This is what you're searching for
"__Special              true false NULL SIGTERM
"__SpecialKey           Never ran into that either
"__Statement            if else return for switch
"__StatusLine           Statusline of current windows
"__StatusLineNC         Statusline of other windows
"__String               "Hello, World!"
"__Todo                 TODO: remove todos from source
"__Type                 int float char void unsigned uint32_t
"__Underlined           Anything underlined
"__VertSplit            :vsplit will only show ' | '
"__Visual               Selected text looks like this
