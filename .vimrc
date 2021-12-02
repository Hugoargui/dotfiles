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
if has("nvim")
    set undodir=~/.vim/tmp/nvimundo//
else
    set undodir=~/.vim/tmp/undo//
endif 
set backupskip=/tmp/*,/private/tmp*" "otherwise VIM breaks when editing cron tabs
set lazyredraw "macros much faster
set ignorecase
set smartcase
"make ESC fast again
" set noesckeys "this option is pointless in nvim"
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
" Don't polute ~ with .viminfo file
if has("nvim")
    let &viminfo .= '.nvim'
else
    set viminfo+=n~/.vim/viminfo
endif
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

" FZF config ---------------------------- {{{
let g:fzf_layout = { 'window': { 'width': 1, 'height': 1 } }
if has('nvim')
    " todo how to fix this
else
    let $FZF_DEFAULT_OPS="--ansi --preview-window 'right:70% --layout reverse'" 
    eval "fzf $FZF_DEFAULT_OPS"
endif

" ------------------------------------------- }}}

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
