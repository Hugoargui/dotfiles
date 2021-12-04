" AUTOINSTALL PLUGGED IF NOT FOUND
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" *************************************************************************
" PLUG
call plug#begin()
" +++++++++++++++++++++++++++++ PLUGINS ++++++++++++++++++++++++++++++
"Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'antoinemadec/coc-fzf', {'branch': 'release'}

Plug 'voldikss/vim-floaterm'
Plug 'TaDaa/vimade'
Plug 'francoiscabrol/ranger.vim'
Plug 'mbbill/undotree'

Plug 'puremourning/vimspector'
Plug 'szw/vim-maximizer'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
if has("nvim")
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
endif

Plug 'haya14busa/incsearch.vim'
" todo replace by haya14busa/is.vim
Plug 'nelstrom/vim-visual-star-search'

Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'michaeljsmith/vim-indent-object'
Plug 'wellle/targets.vim'

" if has("nvim")
    " Plug 'lukas-reineke/indent-blankline' "works only on nvim
    " Plug 'Yggdroot/indentLine'
    Plug 'lukas-reineke/indent-blankline.nvim', { 'branch': 'lua' }
" else
    Plug 'nathanaelkane/vim-indent-guides'
" endif

" todo maybe replace by junegunn/rainbow_parentheses?
Plug 'frazrepo/vim-rainbow'
" this one seems bettern in theory but the colors are less vibrant


Plug 'junegunn/rainbow_parentheses.vim'
Plug 'tpope/vim-commentary'

" Plug 'vim-scripts/RltvNmbr.vim'
" Plug 'yuttie/comfortable-motion.vim'  " smooth scrolling

" Plug 'jackguo380/vim-lsp-cxx-highlight' get CCLS to work
"Plug 'https://github.com/bfrg/vim-cpp-modern'
Plug 'octol/vim-cpp-enhanced-highlight'
" Plug 'https://github.com/mphe/grayout' not working find alternative

" +++++++++++++++++++++++++++++ Color schemes ++++++++++++++++++++++++++++++
Plug 'https://github.com/mhartington/oceanic-next.git'
Plug 'https://github.com/fmoralesc/molokayo.git'
Plug 'arcticicestudio/nord-vim'
Plug 'dracula/vim', { 'name': 'dracula' }
Plug 'altercation/vim-colors-solarized'
Plug 'https://github.com/morhetz/gruvbox.git'
" ==========================================================================

call plug#end()

