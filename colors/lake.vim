" Lake
" A color scheme based on Tudurom's cloudy color palette and z3bra's shblah.vim.
" Only works with gvim or truecolor terminals.

set background=dark
highlight clear
if exists('syntax_on')
    syntax reset
endif
let g:colors_name = 'lake'

let s:fg = '#b8bdc6'
let s:bg = '#273941'
let s:gray0 = '#2a4957'
let s:gray1 = '#405f6d'
let s:gray2 = '#608190'
let s:red = '#a66363'
let s:green = '#63a690'
let s:yellow = '#a6a663'
let s:blue = '#719bc2'
let s:orange = '#bf9c86'
let s:cyan = '#63a69b'
let s:bright_red = '#c27171'
let s:bright_green = '#6dc2a3'
let s:bright_yellow = '#bfc271'
let s:bright_blue = '#719bc2'
let s:bright_orange = s:orange
let s:bright_cyan = '#71c2af'

function! s:h(group, fg, bg, attr)
    if !empty(a:fg)
        exec 'hi ' . a:group . ' guifg=' . a:fg
    endif
    if !empty(a:bg)
        exec 'hi ' . a:group . ' guibg=' . a:bg
    endif
    if !empty(a:attr)
        exec 'hi ' . a:group . ' gui=' . a:attr . ' cterm=' . a:attr
    endif
endfun

" Actual colours and styles.
call s:h('ColorColumn', s:bg, s:yellow, 'none')
call s:h('Comment', s:gray2, s:bg, 'none')
call s:h('Constant', s:orange, s:bg, 'none')
call s:h('Cursor', '', s:fg, 'none') 
call s:h('DiffAdd', s:green, s:bg, 'none')
call s:h('DiffChange', s:bg, s:bg, 'none')
call s:h('DiffDelete', s:fg, s:red, 'none')
call s:h('DiffText', s:fg, s:blue, 'none')
call s:h('Directory', s:blue, s:bg, 'none')
call s:h('Error', s:bg, s:red, 'none')
call s:h('ErrorMsg', s:red, s:bg, 'none')
call s:h('FoldColumn', s:bg, s:bg, 'none')
call s:h('Folded', s:bg, s:bg, 'none')
call s:h('Function', s:fg, s:bg, 'none')
call s:h('Identifier', s:fg, s:bg, 'none')
call s:h('IncSearch', s:bg, s:orange, 'none')
call s:h('NonText', s:gray1, s:bg, 'none')
call s:h('Normal', s:fg, s:bg, 'none')
call s:h('Pmenu', s:bg, s:fg, 'none')
call s:h('PreProc', s:cyan, s:bg, 'none')
call s:h('Search', s:bg, s:orange, 'none')
call s:h('Special', s:green, s:bg, 'none')
call s:h('SpecialKey', s:bg, s:bg, 'none')
call s:h('Statement', s:blue, s:bg, 'none')
call s:h('StatusLine', s:fg, s:gray1, 'bold')
call s:h('StatusLineNC', s:fg, s:gray0, 'none')
call s:h('String', s:green, s:bg, 'none')
call s:h('TabLineSel', s:fg, s:bg, 'none')
call s:h('Todo', s:fg, s:red, 'none')
call s:h('Type', s:blue, s:bg, 'none')
call s:h('Underlined', s:bg, s:bg, 'underline')
call s:h('VertSplit', s:gray1, s:bg, 'none')
call s:h('Visual', s:bg, s:gray1, 'none')
call s:h('WarningMsg', s:yellow, s:bg, 'none')

call s:h('clojureKeyword', s:bright_blue, s:bg, '')
call s:h('clojureDefine', s:green, s:bg, '')

call s:h('pythonBuiltin', s:bright_blue, s:bg, '')

" General highlighting group links.
highlight! link diffAdded       DiffAdd
highlight! link diffRemoved     DiffDelete
highlight! link diffChanged     DiffChange
" highlight! link StatusLine      StatusLineNC
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
