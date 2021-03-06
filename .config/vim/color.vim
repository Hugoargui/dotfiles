set background=dark
colorscheme gruvbox

set numberwidth=1
set nowrap
" set colorcolumn=120
"highlight ColorColumn ctermbg=0 guibg=DarkMagenta ctermbg = DarkRed

" Indent Lines ---------------------------- {{{
if has("nvim")
    " Stupid bug, we get lines painted if we don't set this
    set colorcolumn=99999

    let g:indent_blankline_enabled = v:true
    let g:indent_blankline_char = '┆' "count on fill only

else
    let g:indent_guides_enable_on_vim_startup = 1
    let g:indent_guides_start_level = 1
    let g:indent_guides_guide_size = 1
endif
" ------------------------------------------- }}}

" COLORS ---------------------------- {{{
"************************************************************************************************************
""this ones were ok, removing to see how it looks with unfocused window
"hi String                                        ctermbg = 237      ctermfg = Yellow
"hi Special                                       ctermbg = 237      ctermfg = 121
"hi Character                                     ctermbg = 237             ctermfg = 4
"hi Number                 cterm = bold           ctermbg = 237           ctermfg = 175

hi Search                                        ctermbg = 239           ctermfg = 109
hi IncSearch                                     ctermbg = 235          ctermfg = 108
"************************************************************************************************************

"************************************************************************************************************
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
"General colors
"    hi CocHighlightText                              ctermbg = Blue          ctermfg = Black 
"    hi CursorColumn                                  ctermbg = DarkRed       ctermfg = DarkRed
"    hi Visual                                        ctermbg = White         ctermfg = Black 
"hi Error  
"hi ErrorMsg  
"    hi Comment                                                               ctermfg = Blue
"    hi iCursor                                       ctermbg = Black         ctermfg = White 
"    hi Type                                                                  ctermfg = Yellow
"   hi String                                        ctermbg = DarkGrey      ctermfg = Yellow
"************************************************************************************************************

"************************************************************************************************************
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
"************************************************************************************************************

" ------------------------------------------- }}}

let g:rainbow_active=1

" Fading other windows ---------------------------- {{{

" let g:vimade = {}
" let g:vimade.fadelevel = 0.5
set cursorline
" Hide cursorline on non focused window
augroup CursorLine
    au!
    au VimEnter * setlocal cursorline
    au WinEnter * setlocal cursorline
    au BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END


"set number relativenumber
set number
augroup StartNumbers
    au! Vimenter * silent! nested RltvNmbr
augroup end
augroup KeepNumbers
    autocmd! WinEnter * silent! RltvNmbr
    autocmd! BufWinEnter * silent! RltvNmbr
augroup end

" ------------------------------------------- }}}

" Cursor settings ---------------------------- {{{
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
" ------------------------------------------- }}}
