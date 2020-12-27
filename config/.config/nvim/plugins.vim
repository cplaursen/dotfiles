set nocompatible
filetype off

call plug#begin('~/.config/nvim/plugged')

" Colorschemes
Plug 'rhysd/vim-color-spring-night'
Plug 'sjl/badwolf'

" Languages
Plug 'sheerun/vim-polyglot'
Plug 'lervag/vimtex'
Plug 'jez/vim-better-sml'
Plug 'jalvesaq/nvim-r'
Plug 'sophacles/vim-processing'
Plug 'jceb/vim-orgmode'
Plug 'pbrisbin/vim-syntax-shakespeare'
Plug 'eigenfoo/stan-vim'
Plug 'wlangstroth/vim-racket'
Plug 'felipesere/pie-highlight.vim' 
Plug 'jvoorhis/coq.vim'
Plug 'mlr-msft/vim-loves-dafny', {'for': 'dafny'}

" Experimental
Plug 'cplaursen/vim-isabelle'
Plug 'cplaursen/vim-potion'

" Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Better motions
Plug 'easymotion/vim-easymotion'

" Show indentation with <Leader>ig
Plug 'nathanaelkane/vim-indent-guides'

" tpope plugins
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-eunuch'

" Status bar theme
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" File manager
Plug 'scrooloose/nerdtree'

" Buffer navigation, use <Leader>b to open menu
Plug 'jeetsukumaran/vim-buffergator'

" Writing
Plug 'reedes/vim-pencil'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'dbmrq/vim-ditto'
Plug 'reedes/vim-wordchipper'
Plug 'rhysd/vim-grammarous'
Plug 'vimwiki/vimwiki'

call plug#end()
