set nocompatible
filetype plugin indent on
syntax on

source ~/.config/nvim/plugins.vim


syntax enable
set termguicolors

source ~/.config/nvim/theme/current-theme.vim

"" Use jk to exit insert mode
inoremap jk <ESC>
"" Caps lock still exits insert mode
inoremap JK <ESC>
"" Map the leader key to SPACE
let mapleader="\<SPACE>"
"" Add line numbers
set nu rnu
"" Fix tabs
set tabstop=4 softtabstop=4 expandtab shiftwidth=4 smarttab
"" Make macros faster
set lazyredraw
"" Remove folds
set nofen            
"" Behave better on small screen
set nowrap
"" Yank copies to clipboard
set clipboard=unnamedplus
"" See changes made to a file
:command D w !diff % -
"" Word count in file
:command Count w !texcount -
"" Make Q run the last command
nnoremap Q @@
"" Set filetype of ML files
autocmd BufEnter *.ML set filetype=sml
"" Set filetype of shp files
autocmd BufEnter *.shp set filetype=shp
"" Open file manager
"nnoremap <F2> :NERDTreeToggle<CR>
"" Open fuzzy finder in directory of open file
nnoremap <F3> :Files %:p:h<CR>
"" Quick run via <F5>
"nnoremap <F5> :call <SID>compile_and_run()<CR> 
nnoremap <leader>n :noh<CR>
"
"
"" Remaps for easier window navigation
"set splitbelow splitright
"nmap <silent> <C-J> <C-w>j
"nmap <silent> <C-K> <C-w>k
"nmap <silent> <C-H> <C-w>h
"nmap <silent> <C-L> <C-w>l
"
"" Remaps for tab navigation
"nnoremap <silent> <A-h> :tabprevious<CR>
"nnoremap <silent> <A-l> :tabnext<CR>
"nnoremap <silent> <A-S-H> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
"nnoremap <silent> <A-S-L> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>
"
"" Status bar config
let g:airline_theme = 'violet'
""
"" LaTeX
set grepprg=grep\ -nH\ $*
let g:tex_flavor="latex"
let g:vimtex_view_method="zathura"
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'
autocmd FileType tex set spell spelllang=en_gb
let g:vimtex_compiler_latexmk = {
        \ 'build_dir' : '',
        \ 'callback' : 1,
        \ 'continuous' : 1,
        \ 'executable' : 'latexmk',
        \ 'hooks' : [],
        \ 'options' : [
        \   '-verbose',
        \   '-file-line-error',
        \   '-synctex=1',
        \   '-shell-escape',
        \   '-interaction=nonstopmode',
        \ ],
        \}

" Goyo
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
nnoremap <leader>g :Goyo<CR>

" Pencil
augroup pencil
    autocmd!
    autocmd FileType markdown,mkd,tex,text,vimwiki call pencil#init()
augroup END

let g:pencil#wrapModeDefault = 'soft'
let g:pencil#conceallevel = 1

" Vimwiki
"let g:vimwiki_list = [{'path': '~/Documents/vimwiki'}]

" Treesitter
lua require('config/treesitter')
lua require('lspconfig').pyright.setup{}
lua require('lspconfig').dartls.setup{}
lua require('lspconfig').texlab.setup{}
lua require('lspconfig').ruff_lsp.setup({ init_options = { settings = { } } })

" Run dart format whenever a dart file is saved
autocmd BufWritePre *.dart call s:FormatDart()

function! s:FormatDart()
  let l:formatted = system('dart format --stdin', join(getline(1, '$'), "\n"))
  if v:shell_error
    echohl ErrorMsg | echom 'dart format failed' | echohl None
    return
  endif
  let l:lines = split(l:formatted, "\n")
  call setline(1, l:lines)
endfunction
