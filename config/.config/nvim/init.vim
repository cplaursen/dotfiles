syntax on
source ~/.config/nvim/plugins.vim
filetype plugin indent on

colorscheme spring-night
set termguicolors

" Map the leader key to SPACE
let mapleader="\<SPACE>"
" Add line numbers
set nu rnu
" Fix tabs
set tabstop=4 softtabstop=4 expandtab shiftwidth=4 smarttab
" Make macros faster
set lazyredraw
" See changes made to a file
:command D w !diff % -
" Make escape easier to reach
inoremap <C-c> <ESC>
" Remap leader e to insert one character
nmap <silent> <leader>e "=nr2char(getchar())<cr>P
" Make Q run the last command
nnoremap Q @@
" Autocompile TeX files on write
autocmd BufWritePost *.tex !compiler %
" Open file manager
nnoremap <F2> :NERDTreeToggle<CR>
" Open fuzzy finder in directory of open file
nnoremap <F3> :Files %:p:h<CR>

" Quick run via <F5>
nnoremap <F5> :call <SID>compile_and_run()<CR> 
nnoremap <leader>n :noh<CR>

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
        exec "AsyncRun! time stack runhaskell %"
    elseif &filetype == 'erlang'
        exec "AsyncRun! time erl %"
    elseif &filetype == 'javascript'
        exec "AsyncRun! time rhino %"
    endif
endfunction

" Run in interactive shell and switch to it via <F6>
nnoremap <F6> :call <SID>interactive_shell()<CR>
noremap <leader>l :ALEToggle<CR>

function! s:interactive_shell()
    exec 'w | vsp'
    if &filetype == 'haskell'
        exec "terminal stack ghci %"
    elseif &filetype == 'python'
        exec "terminal ipython -i %"
    elseif &filetype == 'erlang'
        exec "terminal erl"
    endif
endfunction

let g:asyncrun_open = 15

" Remaps for easier window navigation
set splitbelow splitright
nmap <silent> <C-J> <C-w>j
nmap <silent> <C-K> <C-w>k
nmap <silent> <C-H> <C-w>h
nmap <silent> <C-L> <C-w>l

" Remaps for tab navigation
nnoremap <silent> <A-h> :tabprevious<CR>
nnoremap <silent> <A-l> :tabnext<CR>
nnoremap <silent> <A-S-H> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-S-L> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>

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
\    'sh' : [
\         'remove_trailing_lines',
\         'shfmt',
\    ],
\}

let g:ale_linters = {
\    'haskell': [
\         'stack-ghc',
\         'ghc-mod',
\         'hlint',
\         'hdevtools',
\         'hfmt',
\    ],
\}

let g:ale_python_flake8_executable = '/usr/bin/flake8'
let g:ale_python_flake8_use_global = 1

" Status bar config
let g:airline_theme = 'dark_minimal'
