" import traditional vim stuff
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

" hopefully support system clipboard
set clipboard+=unnamedplus
