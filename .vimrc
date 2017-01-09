set shell=/bin/bash

syntax enable
set t_Co=256
colorscheme solarized
set background=dark
autocmd! GUIEnter * set vb t_vb=

" Add line above/below without insert mode
nmap <C-k> O<Esc>j
nmap <C-j> o<Esc>k

" Showing whitespace
set list listchars=tab:\ \ ,trail:·

if has('gui_running')
    set background=dark
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

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
" set switchbuf+=usetab,newtab
set switchbuf+=useopen,usetab,newtab

" Set space as a shortcut
let mapleader = "\<Space>"
nnoremap <Leader>w :w<CR>
nnoremap <Leader>l <C-w>l
nnoremap <Leader>h <C-w>h
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>u <C-u>
nnoremap <Leader>d <C-d>
nnoremap <Leader>q :wq<CR>
nnoremap <Leader>n :vne<CR>
nnoremap <Leader>m :new<CR>
nmap <Leader>g :Ggrep! "\b<C-R><C-W>\b"<CR>:cw<CR><CR>
nnoremap <Leader>x :ccl<CR>

" Utility shortcuts
nnoremap <Leader>J <Esc>:%!python -m json.tool<CR>

" highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" match OverLength /\%81v.\+/
autocmd BufWritePre * :%s/\s\+$//e
" autocmd BufWritePost *.md silent! !python -m markdown -x markdown.extensions.tables % > %:t:r.html
" & ./build.sh %:t:r
set tw=80
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
nnoremap <Leader>t :NERDTreeToggle<CR>
map <C-l> :tabn<CR>
map <C-h> :tabp<CR>
map <C-n> :tabnew<CR>

" syntastic for syntax error check
Bundle 'scrooloose/syntastic'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_mode_map = {
  \  "mode": "passive"
  \ }
nnoremap <Leader>b :SyntasticCheck<CR>

" Tagbar for awesome class strucutre viewing
" Bundle 'majutsushi/tagbar'
" nmap <F8> :TagbarToggle<CR>

" Vim multiple cursor, multiple line editing
Bundle 'terryma/vim-multiple-cursors'

" ctrlp for file finder in vim
Bundle 'kien/ctrlp.vim'
let g:ctrlp_map = '<Leader>p'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
" let g:ctrlp_cmd = 'CtrlPMRU'

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|(node_modules|bower_components|vendor))$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': '',
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
" Plugin 'plasticboy/vim-markdown'
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

Plugin 'tpope/vim-surround'
let g:surround_{char2nr('c')} = "\\\1command\1{\r}"

Plugin 'tpope/vim-repeat'

Plugin 'majutsushi/tagbar'
let g:tagbar_ctags_bin="~/.vim/ctags"
nmap = :TagbarToggle<CR>

" Plugin 'xolox/vim-easytags'
" let g:easytags_file = '~/.vim/tags'
" let g:easytags_cmd = '~/.vim/ctags'
" set tags=./tags;
" let g:easytags_dynamic_files = 1
" let g:easytags_events = ['BufWritePost']
" map <C-[> <CR><C-t>

Plugin 'xolox/vim-misc'

Plugin 'fatih/vim-go'
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap gd <Plug>(go-def-vertical)
Plugin 'vim-jp/vim-go-extra'

Plugin 'godlygeek/tabular'
autocmd FileType go autocmd BufWritePre <buffer> Fmt

Plugin 'Valloric/YouCompleteMe'
" let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
set cmdheight=2
set shortmess=a

Plugin 'pangloss/vim-javascript'
Plugin 'kchmck/vim-coffee-script'
Plugin 'digitaltoad/vim-jade'
Plugin 'klen/python-mode'
let g:pymode_rope = 0

Plugin 'leafgarland/typescript-vim'
let g:syntastic_typescript_tsc_fname = ''
" Plugin 'shougo/vimproc.vim'
" Plugin 'quramy/tsuquyomi'

Plugin 'xuhdev/vim-latex-live-preview'
let g:livepreview_previewer = 'open -a Preview'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
