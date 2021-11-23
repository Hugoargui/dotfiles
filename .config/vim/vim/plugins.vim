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
Plug 'haya14busa/incsearch.vim'
" todo replace by haya14busa/is.vim
Plug 'nelstrom/vim-visual-star-search'

Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'michaeljsmith/vim-indent-object'
Plug 'wellle/targets.vim'

Plug 'nathanaelkane/vim-indent-guides'
" Plug 'lukas-reineke/indent-blankline' works only on nvim
Plug 'frazrepo/vim-rainbow'

Plug 'tpope/vim-commentary'

" Plug 'vim-scripts/RltvNmbr.vim'
" Plug 'yuttie/comfortable-motion.vim'  " smooth scrolling

" Plug 'jackguo380/vim-lsp-cxx-highlight' get CCLS to work
"Plug 'https://github.com/bfrg/vim-cpp-modern'
Plug 'octol/vim-cpp-enhanced-highlight'
" Plug 'https://github.com/mphe/grayout' not working find alternative

" +++++++++++++++++++++++++++++ Color schemes ++++++++++++++++++++++++++++++
" Plug 'https://github.com/mhartington/oceanic-next.git'
" Plug 'https://github.com/chriskempson/base16-vim.git'
" Plug 'https://github.com/fmoralesc/molokayo.git'
Plug 'https://github.com/morhetz/gruvbox.git'
" ==========================================================================

call plug#end()

