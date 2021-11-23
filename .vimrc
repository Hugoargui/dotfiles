source ~/.config/vim/keymaps.vim
" *************************************************************************
source ~/.config/vim/plugins.vim  
source ~/.config/vim/color.vim
source  ~/.config/vim/coc.vim

" Generic editor settings---------------------- {{{
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set hlsearch
set incsearch
set noswapfile
set nobackup
set undofile
set history=1000
set undoreload=10000
set undodir=~/.vim/tmp/undo//
set backupskip=/tmp/*,/private/tmp*" "otherwise VIM breaks when editing cron tabs
set lazyredraw "macros much faster
set ignorecase
set smartcase
"make ESC fast again
set noesckeys 
set timeoutlen=1000
set ttimeoutlen=50
"eliminate pipe in separators, like nerdtree etc
set fillchars+=vert:\ 
"Resize windows when the window is resized
au VimResized * exe "normal! \<c-w>="
" Return to same line when we reopen a file
augroup line_return
    au!
    au BufReadPost *
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
                \     execute 'normal! g`"zvzz' |
                \ endif
augroup END
" ------------------------------------------- }}}

" Removing command line ----------------------- {{{
set noshowmode "get rid of things like --INSERT--"
set noruler
set laststatus=0
set noshowcmd "get rid of display last command"
set cmdheight=1
set shortmess+=F "get rid of the file name displayed in the command line bar"
" ------------------------------------------- }}}

" avoid keeping the previous line " or # or * when going to next line
" a simple set doesnt work as ftpplugin (builtin vim shit) sets += cro
autocmd FileType * set formatoptions-=cro

let g:fzf_layout = { 'window': { 'width': 1, 'height': 1 } }
let $FZF_DEFAULT_OPS="--ansi --preview-window 'right:70% --layout reverse'" 
eval "fzf $FZF_DEFAULT_OPS"


set helpheight=9999

augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
    autocmd FileType vim setlocal foldlevelstart=0 "start with folds closed
augroup END


" Custom fold text ---------------------------- {{{
" override default `foldtext()`, which produces something like:
"
"   +---  2 lines: source $HOME/.vim/pack/bundle/opt/vim-pathogen/autoload/pathogen.vim--------------------------------
"
" Instead returning:
"
"   »··[2lines]··: source $HOME/.vim/pack/bundle/opt/vim-pathogen/autoload/pathogen.vim···································
let s:middot='·'
let s:raquo='»'
function! CustomFoldText() abort
    let l:lines='[' . (v:foldend - v:foldstart + 1) . ' lines'. ']'
    let l:first=substitute(getline(v:foldstart), '\v *', '', '')
    let l:dashes=substitute(v:folddashes, '-', s:middot, 'g')
    return l:lines . l:dashes . l:first
endfunction
if has('folding')
    if has('windows')
        set fillchars=vert:┃              " BOX DRAWINGS HEAVY VERTICAL (U+2503, UTF-8: E2 94 83)
        set fillchars+=fold:·             " MIDDLE DOT (U+00B7, UTF-8: C2 B7)
    endif
    set foldtext=CustomFoldText()
endif
" ------------------------------------------- }}}

"open quickfix automagically and on left sidepane
"augroup quickfixWindow
    "autocmd!
    "autocmd QuickFixCmdPost [^l]* cwindow
    "autocmd QuickFixCmdPost l* lwindow
    "autocmd FileType qf wincmd L
"augroup END

" NERDTREE SHIT ------------------------------- {{{
"open help window maximized automatically
"augroup filetype_help
"    autocmd!  autocmd BufWinEnter * if &l:buftype ==# 'help' | wincmd _ | endif
"augroup END

"let NERDTreeMinimalUI=1 "dont display Press? for help and press .. for up a dir on top
":autocmd FileType nerdtree set norelativenumber
":autocmd FileType taglist set norelativenumber
":autocmd User NERDTreeInit global/src/normal o
":autocmd User NERDTreeInit global/inc/normal o
":autocmd FileType nerdtree hi NonText guibg=NONE guifg=Black gui=NONE
"":autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree && b:NERDTree.isTabTree()) | q | endif
"
""Nerdtree config for wildignore
"set wildignore+=*.pyc,*.o,*.obj,*.svn,*.swp,*.class,*.hg,*.DS_Store,*.min.*
"let NERDTreeRespectWildIgnore=1
"let NERDTreeIgnore=['compile_commands.json']
"
""Highlight currently open  buffer in NERDTree
"autocmd BufEnter * if &modifiable | NERDTreeFind | wincmd p | endif
" ------------------------------------------- }}}
