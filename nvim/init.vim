set nocompatible
filetype off
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle/plugins')

Plugin 'VundleVim/Vundle.vim'

Plugin 'skywind3000/asyncrun.vim'

call vundle#end()



filetype plugin indent on

" Add line numbers
set nu rnu 
" Fix tabs
set tabstop=8 softtabstop=4 expandtab shiftwidth=4 smarttab
" Autocompile TeX files on write
autocmd BufWritePost *.tex !compiler %
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

let g:asyncrun_open = 15

nmap <silent> <C-J> <C-w>j
nmap <silent> <C-K> <C-w>k
nmap <silent> <C-H> <C-w>h
nmap <silent> <C-L> <C-w>l
