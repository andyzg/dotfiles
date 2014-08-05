set shell=/bin/bash
" execute pathogen#infect()

set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" Nerdtree to see directory tree
Bundle 'scrooloose/nerdtree'
map <C-t> :NERDTreeToggle<CR>
" autocmd vimenter * NERDTree
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
map <C-l> :tabn<CR>
map <C-h> :tabp<CR>
map <C-n> :tabnew<CR>

" fugitive for git wrapper in vim
Bundle 'tpope/vim-fugitive'

" syntastic for syntax error check
Bundle 'scrooloose/syntastic'

" Tagbar for awesome class strucutre viewing
Bundle 'majutsushi/tagbar'
nmap <F8> :TagbarToggle<CR>

" Vim multiple cursor, multiple line editing
Bundle 'terryma/vim-multiple-cursors'

" ctrlp for file finder in vim
Bundle 'kien/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
let g:ctrlp_cmd = 'CtrlPMRU'

let g:ctrlp_custom_ignore = {
  \ 'dir':  '*',
  \ 'file': '\v\.(exe|so|dll|js|cpp)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" AutoClose automatically adds brackets
Bundle 'Townk/vim-autoclose'

" easymotion allowing simpler way to use motion
Bundle 'Lokaltog/vim-easymotion'
let g:EasyMotion_leader_key = '<Leader>'

" Autocomplete some stuff
" Bundle 'Valloric/YouCompleteMe'
" let g:ycm_max_diagnostics_to_display = 10
" let g:ycm_key_list_select_completion = ['<TAB>', '<Down>', '<C-j>', '<Enter>']
" let g:ycm_key_list_previous_completion = ['<S-TAB>', '<Up>', '<C-k>']
" let g:ycm_autoclose_preview_window_after_insertion = 1

syntax on
call vundle#end()
filetype plugin indent on

" Add line above/below without insert mode
nmap <C-k> O<Esc>j
nmap <C-j> o<Esc>k

colorscheme solarized
set background=light
set number
set ai
set mouse=

" Shortcuts for folds
inoremap <F9> <C-O>za
nnoremap <F9> za
onoremap <F9> <C-C>za
vnoremap <F9> zf

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/
