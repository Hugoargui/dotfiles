set background=dark
colorscheme gruvbox

"set number relativenumber
set number
augroup StartNumbers
    au! Vimenter * silent! nested RltvNmbr
augroup end
augroup KeepNumbers
    autocmd! WinEnter * silent! RltvNmbr
    autocmd! BufWinEnter * silent! RltvNmbr
augroup end

set numberwidth=1
set nowrap
" set colorcolumn=120
"highlight ColorColumn ctermbg=0 guibg=DarkMagenta ctermbg = DarkRed

" indent lines
if has("nvim")
    " Backup plan revert to the one in vim, which doesn't work on empty lines
    " let g:indent_guides_enable_on_vim_startup = 1
    " let g:indent_guides_start_level = 1
    " let g:indent_guides_guide_size = 1

    " highlight IndentBlanklineIndent1 ctermbg=blue
    " highlight IndentBlanklineIndent2 ctermbg=red

    " let g:indentLine_enabled = 1
    " let g:indentLine_char = '|'
    " let g:indentLine_leadingSpaceChar = '.'
    " let g:indentLine_leadingSpaceEnabled = 1
    " let g:indentLine_showFirstIndentLevel = 1
    " highlight IndentBlanklineChar ctermbg=blue
    " let g:indentLine_char_highlight = 'IndentBlanklineChar'

 set colorcolumn=99999
    let g:indent_blankline_enabled = v:true
    " let g:indent_blankline_char_list = ['|', '¦', '┆', '┊']

    let g:indent_blankline_char = '┆' "count on fill only

    " let g:indent_blankline_space_char = '.' "count on fill only
    " let g:indent_blankline_char_blankline= '|' "count on fill only
    " let g:indent_blankline_space_char_blankline= '.' "count on fill only

    " let g:indent_blankline_space_char_highlight_list = ['BufTabLineHidden', 'StatusLineNC']
    " let g:indent_blankline_space_char_highlight_list = ['SignColumn', 'IndentLinesOdd']

    " let g:indentLine_bufNameExclude = { "term:.*" }

else
    let g:indent_guides_enable_on_vim_startup = 1
    let g:indent_guides_start_level = 1
    let g:indent_guides_guide_size = 1
endif


"this doesnt work with i3
"autocmd WinEnter,FocusGained * RltvNmbr
"autocmd WinLeave,FocusLost   * !RltvNmbr

"General colors
"    hi CocHighlightText                              ctermbg = Blue          ctermfg = Black 
"    hi CursorColumn                                  ctermbg = DarkRed       ctermfg = DarkRed
hi Search                                        ctermbg = 239           ctermfg = 109
hi IncSearch                                     ctermbg = 235          ctermfg = 108
"    hi Visual                                        ctermbg = White         ctermfg = Black 
"hi Error  
"hi ErrorMsg  
"    hi Comment                                                               ctermfg = Blue
"    hi iCursor                                       ctermbg = Black         ctermfg = White 
"    hi Type                                                                  ctermfg = Yellow
"   hi String                                        ctermbg = DarkGrey      ctermfg = Yellow

""this ones were ok, removing to see how it looks with unfocused window
"hi String                                        ctermbg = 237      ctermfg = Yellow
"hi Special                                       ctermbg = 237      ctermfg = 121
"hi Character                                     ctermbg = 237             ctermfg = 4
"hi Number                 cterm = bold           ctermbg = 237           ctermfg = 175
"" after this it wasn't being used

"    hi Function                                                              ctermfg = Green
"    hi Operator                                                                             ctermfg = White
"    hi Identifier                                                                           ctermfg = Green
"    hi MatchParen                                                   ctermbg = Brown         ctermfg = Yellow
"    hi Statement                                                                            ctermfg = LightGreen
"    hi Folded                                                       ctermbg = DarkBlue      ctermfg = White
"    hi FoldColum                                                    ctermbg = DarkBlue      ctermfg = White
"    hi PmenuSel                                                     ctermbg = DarkGreen     ctermfg = Black
"    hi Pmenu                                                        ctermbg = DarkCyan      ctermfg = Black
"    autocmd CursorHold * silent call CocActionAsync('highlight')

set cursorline
" Hide cursorline on non focused window
augroup CursorLine
    au!
    au VimEnter * setlocal cursorline
    au WinEnter * setlocal cursorline
    au BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END
let g:rainbow_active=1
augroup RainbowParens
    au!
    au VimEnter * let g:rainbow_active=1
    au WinEnter * let g:rainbow_active=1
    au BufWinEnter * let g:rainbow_active=1
    au WinLeave * let g:rainbow_active=0
augroup END
" let g:vimade = {}
" let g:vimade.fadelevel = 0.5


"hi cursorLine                                                       cterm=none ctermbg=DarkGrey
"hi CursorLineNr                                                     cterm=none ctermbg=DarkGrey ctermfg=DarkGrey
"hi LineNr                                                           cterm=none ctermbg=DarkGrey ctermfg=LightYellow     
" Change Color when entering Insert Mode
"autocmd InsertEnter * highlight CursorLine                          cterm=none ctermbg=DarkGrey
"autocmd InsertEnter * highlight CursorLineNr                        cterm=none ctermbg=Blue     ctermfg=Blue
"autocmd InsertEnter * highlight LineNr                              cterm=none ctermbg=DarkGrey ctermfg=LightYellow     
"" Revert Color to default when leaving Insert Mode
"autocmd InsertLeave * highlight  CursorLine                         cterm=none ctermbg=DarkGrey
"autocmd InsertLeave * highlight  CursorLineNr                       cterm=none ctermbg=DarkGrey ctermfg=DarkGrey
"autocmd InsertLeave * highlight  LineNr                             cterm=none ctermbg=DarkBlue

"Cursor settings:
""  1 -> blinking block
"  2 -> solid block 
"  "  3 -> blinking underscore
"  "  4 -> solid underscore
"  "  5 -> blinking vertical bar
"  "  6 -> solid vertical bar
let &t_SI.="\e[6 q" "SI = INSERT mode
let &t_SI="\<Esc>[6 q""]"
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[2 q" "EI = NORMAL mode (else)
