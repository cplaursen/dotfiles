set nocompatible
filetype off

call plug#begin('~/.config/nvim/plugged')

" Run programs
Plug 'skywind3000/asyncrun.vim'

" Linter
Plug 'w0rp/ale'

" Show indentation with <Leader>ig
Plug 'nathanaelkane/vim-indent-guides'

" tpope plugins
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-eunuch'

" Git wrapper, commands look like :G<command> or :Git <command>
Plug 'tpope/vim-fugitive'

" Status bar theme
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Buffer navigation, use <Leader>b to open menu
Plug 'jeetsukumaran/vim-buffergator'

" Buffer fuzzy finder
Plug 'ctrlpvim/ctrlp.vim'

" Editing R in nvim
Plug 'jalvesaq/nvim-r'

" Markdown
Plug 'plasticboy/vim-markdown'

" Editing org mode in nvim
Plug 'jceb/vim-orgmode'

" Editing haskell in vim
Plug 'neovimhaskell/haskell-vim'
 
" Yesod
Plug 'pbrisbin/vim-syntax-shakespeare'

" Distraction-free writing
Plug 'junegunn/goyo.vim'

" Look up things
Plug 'mattn/webapi-vim'
Plug 'christoomey/vim-quicklink'

call plug#end()
