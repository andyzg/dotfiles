set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" SYNTAX STUFF
set number
set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set cindent

" Add line above/below without insert mode
nmap <C-k> O<Esc>j
nmap <C-j> o<Esc>k

" Auto brackets
inoremap { {<CR>}<Esc>O

"AUTORUN FOR NERDTREE
autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
map <C-l> :tabn<CR>
map <C-h> :tabp<CR>
map <C-n> :tabnew<CR>

" Shortcuts for folds
inoremap <F9> <C-O>za
nnoremap <F9> za
onoremap <F9> <C-C>za
vnoremap <F9> zf

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" Nerdtree to see directory tree
Bundle 'scrooloose/nerdtree'
map <C-t> :NERDTreeToggle<CR>

" fugitive for git wrapper in vim
Bundle 'tpope/vim-fugitive'

" syntastic for syntax error check
Bundle 'scrooloose/syntastic'

" Tagbar for awesome class strucutre viewing
Bundle 'majutsushi/tagbar'
nmap <F8> :TagbarToggle<CR>

" supertab for autocompletion with tabs
Bundle 'ervandew/supertab'

" ctrlp for file finder in vim
Bundle 'kien/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
  
" easymotion allowing simpler way to use motion
Bundle 'Lokaltog/vim-easymotion'
let g:EasyMotion_leader_key = '<Leader>'

filetype plugin indent on     " required!
