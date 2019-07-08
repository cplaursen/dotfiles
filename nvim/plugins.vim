set nocompatible
filetype off
call plug#begin('~/.config/nvim/plugged')

" Run programs
Plug 'skywind3000/asyncrun.vim'

" Linter
Plug 'w0rp/ale'

" Completion
Plug 'neoclide/coc.nvim', {'branch':'release'}

" Show indentation with <Leader>ig
Plug 'nathanaelkane/vim-indent-guides'

" Snippets
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate' 

" tpope plugins
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sensible'

" Git wrapper, commands look like :G<command> or :Git <command>
Plug 'tpope/vim-fugitive'

" Status bar theme
Plug 'itchyny/lightline.vim'

" Directory navigation
Plug 'scrooloose/nerdtree'

" Buffer navigation, use <Leader>b to open menu
Plug 'jeetsukumaran/vim-buffergator'

" Language packs
Plug 'sheerun/vim-polyglot'

" Editing R in nvim
Plug 'jalvesaq/nvim-r'

" Markdown
Plug 'plasticboy/vim-markdown'

" Editing org mode in nvim
Plug 'jceb/vim-orgmode'

" Look up haskell things
Plug 'twinside/vim-hoogle'

" Yesod
Plug 'pbrisbin/vim-syntax-shakespeare'

" Distraction-free writing
Plug 'junegunn/goyo.vim'

" Look up things
Plug 'mattn/webapi-vim'
Plug 'christoomey/vim-quicklink'

" Colorscheme
Plug 'rhysd/vim-color-spring-night'

" Terminal
Plug 'Shougo/deol.nvim'

call plug#end()
