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
" Remove folds
set nofen            
" Behave better on small screen
set nowrap
" See changes made to a file
:command D w !diff % -
" Word count in file
:command Count w !texcount -
" Make escape easier to reach
inoremap <C-c> <ESC>
" Remap leader e to insert one character
nmap <silent> <leader>e "=nr2char(getchar())<cr>P
" Make Q run the last command
nnoremap Q @@
" Set filetype of ML files
autocmd BufEnter *.ML set filetype=sml
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
        exec "AsyncRun! time runhaskell %"
    elseif &filetype == 'erlang'
        exec "AsyncRun! time erl %"
    elseif &filetype == 'javascript'
        exec "AsyncRun! time rhino %"
    endif
endfunction

" Run in interactive shell and switch to it via <F6>
nnoremap <F6> :call <SID>interactive_shell()<CR>

function! s:interactive_shell()
    if &filetype == 'haskell'
        exec 'w | vsp'
        exec "terminal ghci %"
    elseif &filetype == 'python'
        exec 'w | vsp'
        exec "terminal ipython -i %"
    elseif &filetype == 'erlang'
        exec 'w | vsp'
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

" Status bar config
let g:airline_theme = 'dark_minimal'

" LaTeX
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"
let g:vimtex_view_method = "zathura"
autocmd FileType tex set spell spelllang=en_gb

" Disable folds
let Tex_FoldedSections=""
let Tex_FoldedEnvironments=""
let Tex_FoldedMisc=""

" Goyo
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
nnoremap <leader>g :Goyo<CR>

" Pencil
augroup pencil
    autocmd!
    autocmd FileType markdown,mkd,tex call pencil#init()
augroup END

let g:pencil#wrapModeDefault = 'soft'

" Ditto
au FileType markdown,text,tex DittoOn  " Turn on Ditto's autocmds
nmap <leader>di <Plug>ToggleDitto      " Turn Ditto on and off
nmap =d <Plug>DittoNext                " Jump to the next word
nmap -d <Plug>DittoPrev                " Jump to the previous word
nmap +d <Plug>DittoGood                " Ignore the word under the cursor
nmap _d <Plug>DittoBad                 " Stop ignoring the word under the cursor
nmap ]d <Plug>DittoMore                " Show the next matches
nmap [d <Plug>DittoLess                " Show the previous matches

" SML
augroup vimbettersml
  au!  
  " ----- Keybindings -----

  au FileType sml nnoremap <silent> <buffer> <leader>t :SMLTypeQuery<CR>
  au FileType sml nnoremap <silent> <buffer> gd :SMLJumpToDef<CR>

  " open the REPL terminal buffer
  au FileType sml nnoremap <silent> <buffer> <leader>is :SMLReplStart<CR>
  " close the REPL (mnemonic: k -> kill)
  au FileType sml nnoremap <silent> <buffer> <leader>ik :SMLReplStop<CR>
  " build the project (using CM if possible)
  au FileType sml nnoremap <silent> <buffer> <leader>ib :SMLReplBuild<CR>
  " for opening a structure, not a file
  au FileType sml nnoremap <silent> <buffer> <leader>io :SMLReplOpen<CR>
  " use the current file into the REPL (even if using CM)
  au FileType sml nnoremap <silent> <buffer> <leader>iu :SMLReplUse<CR>
  " clear the REPL screen
  au FileType sml nnoremap <silent> <buffer> <leader>ic :SMLReplClear<CR>
  " set the print depth to 100
  au FileType sml nnoremap <silent> <buffer> <leader>ip :SMLReplPrintDepth<CR>
  " Conceal characters
  " au FileType sml setlocal conceallevel=2 
  " Same-width conceal characters
  let g:sml_greek_tyvar_show_tick = 1
augroup END


" CoC
source ~/.config/nvim/coc.vim 
