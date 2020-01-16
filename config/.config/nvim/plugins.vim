set nocompatible
filetype off

call plug#begin('~/.config/nvim/plugged')

" Colorscheme
Plug 'rhysd/vim-color-spring-night'

" Languages
Plug 'sheerun/vim-polyglot'
Plug 'lervag/vimtex'
Plug 'jez/vim-better-sml'
Plug 'jalvesaq/nvim-r'
Plug 'jceb/vim-orgmode'
Plug 'pbrisbin/vim-syntax-shakespeare'

" Completion
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

" Better motions
Plug 'easymotion/vim-easymotion'

" Run programs
Plug 'skywind3000/asyncrun.vim'

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

" File manager
Plug 'scrooloose/nerdtree'

" Buffer navigation, use <Leader>b to open menu
Plug 'jeetsukumaran/vim-buffergator'

" Buffer fuzzy finder
Plug 'ctrlpvim/ctrlp.vim'

" Writing
Plug 'reedes/vim-pencil'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'dbmrq/vim-ditto'
Plug 'reedes/vim-wordchipper'
Plug 'rhysd/vim-grammarous'

" Snippets
Plug 'honza/vim-snippets'

" Task manager
Plug 'blindFS/vim-taskwarrior'
call plug#end()

let g:polyglot_disabled=['latex']
