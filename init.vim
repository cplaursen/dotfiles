set nocompatible
filetype off
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle/plugins')

Plugin 'VundleVim/Vundle.vim'
Plugin 'skywind3000/asyncrun.vim'
Plugin 'w0rp/ale'
Plugin 'nathanaelkane/vim-indent-guides'

" tpope plugins
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-sensible'

" NCM2 plugins
Plugin 'roxma/nvim-yarp'
Plugin 'ncm2/ncm2'
Plugin 'ncm2/ncm2-bufword'
Plugin 'ncm2/ncm2-path'

call vundle#end()

filetype plugin indent on

" Map the leader key to SPACE
let mapleader="\<SPACE>"
" Add line numbers
set nu rnu 
" Fix tabs
set tabstop=8 softtabstop=4 expandtab shiftwidth=4 smarttab
" Remap leader e to insert one character
:nmap <silent> <leader>e "=nr2char(getchar())<cr>P
" Autocompile TeX files on write
autocmd BufWritePost *.tex !compiler %
" Copy dotfiles to my dotfile repo
let dotfiles = ['init.vim', '.bashrc']
autocmd BufWritePost * if index(dotfiles, expand('%:t')) >= 0| !cp % ~/Documents/dotfiles/%:t
" Remove 
autocmd VimLeave !rm -rf *.ali *.o
" Quick run via <F5>
nnoremap <F5> :call <SID>compile_and_run()<CR> 

function! s:compile_and_run()
    exec 'w'
    if &filetype == 'c'
        exec "AsyncRun! gcc % -o %<; time ./%<"
    elseif &filetype == 'cpp'
       exec "AsyncRun! g++ -std=c++11 % -o %<; time ./%<"
    elseif &filetype == 'java'
       exec "AsyncRun! javac %; time java %<"
    elseif &filetype == 'sh'
       exec "AsyncRun! time bash %"
    elseif &filetype == 'python'
       exec "AsyncRun! time python %"
    elseif &filetype == 'ada'
	exec "AsyncRun! gnatmake % -o %<; time ./%<"
    elseif &filetype == 'haskell'
        exec "AsyncRun! time runhaskell %"
    endif
endfunction

" Run in interactive shell and switch to it via <F6>
nnoremap <F6> :call <SID>interactive_shell()<CR>
noremap <leader>l :ALEToggle<CR>

function! s:interactive_shell()
    exec 'w'
    if &filetype == 'python'
        exec "split"
        exec "terminal ipython % -i"
    elseif &filetype == 'haskell'
        exec "split"
        exec "terminal ghci % -i"
    endif
endfunction

let g:asyncrun_open = 15

" Remaps for easier window navigation
set splitbelow splitright
nmap <silent> <C-J> <C-w>j
nmap <silent> <C-K> <C-w>k
nmap <silent> <C-H> <C-w>h
nmap <silent> <C-L> <C-w>l


" ALE definitions

nmap <F8> <Plug>(ale_fix)
let g:ale_lint_on_save = 1
let g:ale_lint_on_filetype_changed = 0
let g:ale_fixers = {
\    'python': [
\        'remove_trailing_lines',
\        'isort',
\        'yapf',
\    ],
\    'haskell': [
\         'remove_trailing_lines',
\         'hfmt',
\    ],
\}

let g:ale_python_flake8_executable = '/usr/bin/flake8'
let g:ale_python_flake8_use_global = 1


" NCM2 tings

autocmd BufEnter * call ncm2#enable_for_buffer()

set completeopt=noinsert,menuone,noselect
set shortmess+=c

inoremap <c-c> <ESC>

" When the enter key is pressed it closes the autocomplete menu for ncm2
inoremap <expr> <CR> (pumvisible() ? "\<c-y>" : "\<CR>")

" Use <TAB> to select in the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>" 
