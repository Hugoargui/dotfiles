noremap <SPACE> <Nop>
let mapleader = "\<Space>"

" GETTING ALT MAPPINGS TO WORK---------------------- {{{
" 
" for only one key, just this is enough: execute "set <M-d>=\ed"
" but let's do a loop to set all keys in case of future use
let c='a'
while c <= 'z'
    exec "set <A-".c.">=\e".c
    exec "imap \e".c." <A-".c.">"
    let c = nr2char(1+char2nr(c))
endw
" if <timeout, vim knows <esc>char is alt+char. If longer, it's two keystrokes
set timeout ttimeoutlen=5
" ------------------------------------------- }}}

fun GotoWindow(id)
    call win_gotoid(a:id)
    MaximizerToggle
endfun
nnoremap <leader>m :MaximizerToggle!<CR>

" DEBUG MAPPINGS---------------------- {{{
" Set the basic sizes
let g:vimspector_sidebar_width = 60
let g:vimspector_code_width = 80
function! s:CustomiseUI()
    " Close the output window
    call win_gotoid( g:vimspector_session_windows.output  )
    q
    "start in code window
    call win_gotoid( g:vimspector_session_windows.code  )
    " Clear the existing WinBar created by Vimspector
    nunmenu WinBar
endfunction
function s:SetUpTerminal()
    " Customise the terminal window size/position
    " For some reasons terminal buffers in Neovim have line numbers
    call win_gotoid( g:vimspector_session_windows.terminal  )
    q
endfunction

augroup MyVimspectorUICustomistaion
    autocmd!
    autocmd User VimspectorUICreated call s:CustomiseUI()
    autocmd User VimspectorTerminalOpened call s:SetUpTerminal()
augroup END

nnoremap <A-d> :call vimspector#Launch()<CR>

nnoremap <leader>dc :call GotoWindow(g:vimspector_session_windows.code)<CR>
nnoremap <leader>dt :call GotoWindow(g:vimspector_session_windows.tagpage)<CR>
nnoremap <leader>dv :call GotoWindow(g:vimspector_session_windows.variables)<CR>
nnoremap <leader>dw :call GotoWindow(g:vimspector_session_windows.watches)<CR>
nnoremap <leader>ds :call GotoWindow(g:vimspector_session_windows.stack_trace)<CR>
nnoremap <leader>do :call GotoWindow(g:vimspector_session_windows.output)<CR>

nnoremap <A-i> :call vimspector#StepInto()<CR>
nnoremap <A-n> :call vimspector#StepOver()<CR>
nnoremap <A-o> :call vimspector#StepOut<()CR>
nnoremap <A-t> :call vimspector#RunToCursor()<CR>
nnoremap <A-r> :call vimspector#Continue()<CR>

nnoremap <A-e> :call vimspector#Reset()<CR>
nnoremap <A-z> :call vimspector#Restart()<CR>

nnoremap <A-b> :call vimspector#ToggleBreakpoint()<CR>
" ------------------------------------------- }}}


" Standard NORMAL mode mappings---------------------- {{{
nnoremap Y y$

" Window navigation
nnoremap <silent> <c-h> <c-w><c-h>
nnoremap <silent> <c-l> <c-w><c-l>
nnoremap <silent> <a-s> <c-w>r " swap windows
nnoremap <silent> <c-left> :vertical resize -5<CR>
nnoremap <silent> <c-right> :vertical resize +5<CR>
nnoremap <silent> <a-u> :UndotreeToggle <CR>

" when using smooth scrolling plugins, relativnmb doesnt update until you go down/up one line
nnoremap <c-u> <c-u>j
nnoremap <c-d> <c-d>k
nnoremap <c-f> <c-f>j
nnoremap <c-y> <c-y>k

" Keep search maches in the middle of the window and pulse the mach when moving
nnoremap n nzzzv
nnoremap N Nzzzv

" Don't move to next word on *
nnoremap * *<c-o>
" Same when running around
nnoremap g; g;zz
nnoremap g, g,zz
 
" faster %s
nnoremap <leader>s :%s/

" clear screen (cltr-l)clears highlighted searches
nnoremap <silent> <a-l> :nohlsearch<CR><c-l>
"split line at cursor (default K is man page of word under cursor)
nnoremap K i<CR><Esc>
" Ctrl-j deletes the line below the current line, if it's blank
nnoremap <silent><C-j> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
" Ctrl-k deletes the line above the current line, if it's blank
nnoremap <silent><C-k> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
" insert blank line above
nnoremap <silent><leader>j :set paste<CR>m`o<Esc>``:set nopaste<CR>
" insert blank line bellow
nnoremap <silent><leader>k :set paste<CR>m`O<Esc>``:set nopaste<CR>

" Syntax group under cursor
nnoremap <leader>h :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
            \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
            \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>


nnoremap <A-c> :make<CR>
set makeprg=clang\ -g\ -std=c++17\ -lstdc++\ -lm\ -ltbb\ -Wall\ -Wextra\ -o\ binary\ % 

" run from vim
nnoremap <A-x> :!./binary<CR>

nnoremap <leader>vm :e $MYVIMRC<CR>
nnoremap <leader>vk :e ~/.config/vim/keymaps.vim<CR>
nnoremap <leader>vc :e ~/.config/vim/color.vim<CR>
nnoremap <leader>vs :source %<CR>
" change or delete mapping for word under cursor. n/N to skip, . to repeat
nnoremap c* /\<<C-R>=expand('<cword>')<CR>\>\C<CR>``cgn
nnoremap c# ?\<<C-R>=expand('<cword>')<CR>\>\C<CR>``cgN
nnoremap d* /\<<C-r>=expand('<cword>')<CR>\>\C<CR>``dgn
nnoremap d# ?\<<C-r>=expand('<cword>')<CR>\>\C<CR>``dgN
" ------------------------------------------- }}}

" Standard VISUAL mode mappings---------------------- {{{
nnoremap Y y$
"because I would rather do > three times than do ><ESC>...
"keep lines selected after yo've indented them
xnoremap > >gv
xnoremap < <gv
xnoremap <Tab> >gv
xnoremap <S-Tab> <gv

" Focus current fold (fold all others)
nnoremap <leader>z zMzvzz
" ------------------------------------------- }}}

" Standard INSERT mode mappings---------------------- {{{
" during insert mode ctrl-k turns current Word into upercase and goes back to insert
inoremap <c-k> <esc>gUiWEa
" easier line autocomplete
inoremap <c-l> <c-x><c-l> 
" autocoplete the rest of the line above
inoremap <c-s> <esc>kly$jpa
" autocomplete the rest of the word above 
inoremap <c-w> x<esc>xklyWjpa
inoremap <c-a> <esc>I
inoremap <c-e> <esc>A


" ------------------------------------------- }}}

" Standard COMMAND mode mappings---------------------- {{{
cnoremap <c-a> <home>
cnoremap <c-e> <end>
"oopsie, forgot to open file in sudo
cmap w!! w !sudo tee % >/dev/null 
" ------------------------------------------- }}}

" Scroll wheel inserts ABCD in insert mode----------- {{{
" change it to NOP
"imap <ESC>OA <nop>
"imap <ESC>OB <nop>
"imap <ESC>OC <nop>
"imap <ESC>OD <nop>
" ------------------------------------------- }}}

" C/CPP abreviations ---------------------- {{{
augroup filetype_c
    autocmd!
    autocmd FileType c :iabbrev <buffer> rt return ;<left>
    autocmd FileType cpp :iabbrev <buffer> rt return ;<left>
    autocmd FileType c :iabbrev <buffer> return PLEASEUSE_RT_ABREV
    autocmd FileType cpp :iabbrev <buffer> return PLEASEUSE_RT_ABREV
augroup END
" ------------------------------------------- }}}
 
let g:floaterm_width=0.9
let g:floaterm_height=0.9
let g:floaterm_title=""
nnoremap   <silent>   <C-t>  :FloatermToggle<CR>
tnoremap   <silent>   <C-t>   <C-\><C-n>:FloatermToggle <CR>
augroup terminal 
    autocmd!
    autocmd QuitPre * :FloatermKill<CR>
augroup end

" use sane regexes
nnoremap / /\v
nnoremap ? ?\v
vnoremap / /\v
vnoremap ? ?\v

cnoremap <expr> v% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" - Open FZXF search in vim
" map <C-p> <Esc><Esc>:Files!<CR> "doesn't ignore .gitingore"
map <C-p> <Esc><Esc>:GFiles!<CR>
map <A-g> <Esc><Esc>:Ag<CR>

"in vmode hit r to paste onto selected
vmap r "_dP 

"nnoremap [a :cfirst<CR>
"nnoremap [s :cprev<CR>
"nnoremap [d :cnext<CR>
"nnoremap [f :clast<CR>
"nnoremap [x :cclose<CR>
"nnoremap [z :copen<CR>

" SEARCH AND REPLACE
" Press * to search for the term under the cursor
" or a visual selection (requres visual * plugin)
" press <leader?r to replace all instances of it in the current file 
"nnoremap <Leader>r :%s///g<Left><Left>
"nnoremap <Leader>rc :%s///gc<Left><Left><Left>
" replace only in visual selection
"xnoremap <Leader>r :%s///g<Left><Left>
"xnoremap <Leader>rc :%s///gc<Left><Left><Left>
" add semicolom at end of line in normal or insert mode 
"inoremap <> <esc>mm$a;<esc>`ma
"nnoremap <> <esc>mm$a;<esc>`m

" Start NERDTree when Vim is started without file arguments.
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
"" Start NERDTree and put the cursor back in the other window.
"autocmd VimEnter * NERDTree | wincmd p
"
"nnoremap <C-h> :NERDTreeFocus<CR>
"nnoremap <C-n> :NERDTree<CR>
"nnoremap <C-t> :NERDTreeToggle<CR>
""noremap <C-f> :NERDTreeFind<CR>
"let g:NERDTreeWinSize=20
"" If it's the last window, close it: 
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"
"inoremap <C-x> <eSC>:wq<CR>
"nnoremap <C-x> <eSC>:wq<CR>

"for incremental search
"map /  <Plug>(incsearch-forward)
"map ?  <Plug>(incsearch-backward)
"map g/ <Plug>(incsearch-stay)
