set shell=/bin/bash

syntax enable
set t_Co=256
colorscheme solarized
set background=dark

" Add line above/below without insert mode
nmap <C-k> O<Esc>j
nmap <C-j> o<Esc>k

" Showing whitespace
set list listchars=tab:\ \ ,trail:·

if has('gui_running')
    set background=light
else
    set background=dark
endif

set expandtab
set tabstop=2
set shiftwidth=2
set ai
set number
set ruler " show the cursor

" Shortcuts for folds
" inoremap <F9> <C-O>za
" nnoremap <F9> za
" onoremap <F9> <C-C>za
" vnoremap <F9> zf
inoremap {<CR>  {<CR>}<Esc>ko

" Shortcut for pasting from clipboard
noremap gp "*p
noremap gP "*P
noremap gyy "*yy

" highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" match OverLength /\%81v.\+/
" autocmd BufWritePre * :%s/\s\+$//e
autocmd BufWritePost *.md silent! !python -m markdown -x markdown.extensions.tables % > %:t:r.md.html & ./build.sh %:t:r
" set tw=79
set backspace=2
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Nerdtree to see directory tree
Bundle 'scrooloose/nerdtree'
map <C-t> :NERDTreeToggle<CR>
map <C-l> :tabn<CR>
map <C-h> :tabp<CR>
map <C-n> :tabnew<CR>

" syntastic for syntax error check
Bundle 'scrooloose/syntastic'
let g:syntastic_always_populate_loc_list = 1

" Tagbar for awesome class strucutre viewing
" Bundle 'majutsushi/tagbar'
" nmap <F8> :TagbarToggle<CR>

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
" let g:ctrlp_cmd = 'CtrlPMRU'

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }


" easymotion allowing simpler way to use motion
Plugin 'Lokaltog/vim-easymotion'
let g:EasyMotion_leader_key = '<Leader>'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'

Plugin 'bling/vim-airline'
let g:airline#extensions#tabline#enabled = 1
set laststatus=2

Plugin 'tpope/vim-markdown'
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

Plugin 'tpope/vim-surround'

Plugin 'tpope/vim-repeat'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
