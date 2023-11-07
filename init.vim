set shell=/bin/bash

" syntax enable
set t_Co=256
colorscheme solarized
set background=light
autocmd! GUIEnter * set vb t_vb=
set mouse=v

" Reload the file each time it changes
set autoread
au CursorHold * checktime

" Add line above/below without insert mode
nmap <C-k> O<Esc>j
nmap <C-j> o<Esc>k

" Showing whitespace
set list listchars=tab:\ \ ,trail:·

if has('gui_running')
    set background=light
else
    set background=light
endif

set expandtab
set tabstop=2
set shiftwidth=2
set ai
set number
set ruler " show the cursor

" Shortcuts for folds
"-- FOLDING --
set foldmethod=syntax "syntax highlighting items specify folds
set foldcolumn=1 "defines 1 col at window left, to indicate folding
let javaScript_fold=1 "activate folding by JS syntax
set foldlevelstart=99 "start file with all folds opened
nnoremap zp zczA

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

" Write
nnoremap <Leader>w :w<CR>

" Moving around
nnoremap <Leader>l <C-w>l
nnoremap <Leader>h <C-w>h
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k

" Swapping buffers
nnoremap <Leader><S-l> <C-w><S-l>
nnoremap <Leader><S-h> <C-w><S-h>
nnoremap <Leader><S-j> <C-w>r


nnoremap <Leader>u <C-u>
nnoremap <Leader>d <C-d>
nnoremap <Leader>q :wq<CR>

" New windows
nnoremap <Leader>n :vne<CR>
nnoremap <Leader>m :new<CR>

" Grep a text
nmap <Leader>g :Ggrep! "\b<C-R><C-W>\b"<CR>:cw<CR><CR>

" ???
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
let g:ctrlp_custom_ignore = '(node_modules|DS_Store|git|env|dist)'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
" let g:ctrlp_cmd = 'CtrlPMRU'

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|(node_modules|bower_components|vendor|venv|dist))$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': '',
  \ }


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

" Plugin 'fatih/vim-go'
" au FileType go nmap <leader>r <Plug>(go-run)
" au FileType go nmap <leader>b <Plug>(go-build)
" au FileType go nmap <leader>t <Plug>(go-test)
" au FileType go nmap <leader>c <Plug>(go-coverage)
" au FileType go nmap gd <Plug>(go-def-vertical)
" Plugin 'vim-jp/vim-go-extra'

Plugin 'godlygeek/tabular'
autocmd FileType go autocmd BufWritePre <buffer> Fmt

Plugin 'pangloss/vim-javascript'
" Plugin 'kchmck/vim-coffee-script'
" Plugin 'digitaltoad/vim-jade'
" Plugin 'klen/python-mode'
" let g:pymode_rope = 0
" let g:pymode_lint_config = '$HOME/.dotfiles/pylint.rc'
" let g:pymode_lint_ignore = "W0401,E501,E266,E231"
" set nofoldenable

" Plugin 'omnisharp/omnisharp-vim'
Plugin 'tpope/vim-dispatch'
Plugin 'wavded/vim-stylus'
Plugin 'leafgarland/typescript-vim'
let g:syntastic_typescript_tsc_fname = ''
" Plugin 'shougo/vimproc.vim'
" Plugin 'quramy/tsuquyomi'

" Plugin 'xuhdev/vim-latex-live-preview'
" let g:livepreview_previewer = 'open -a Preview'

Plugin 'christoomey/vim-tmux-navigator'

Plugin 'ajh17/vimcompletesme'
autocmd FileType vim let b:vcm_tab_complete = 'vim'

" Vim specific setting
set omnifunc=syntaxcomplete#Complete

Plugin 'universal-ctags/ctags'
Plugin 'ludovicchabant/vim-gutentags'
let g:gutentags_ctags_tagfile = '.tags'
nnoremap <Leader>] <C-]>
nnoremap <Leader>[ <C-o>


Plugin 'mileszs/ack.vim'
cnoreabbrev Ack Ack!
nnoremap <Leader>f :Ack!<Space>

" Plugin 'tomlion/vim-solidity'

" Plugin 'github/copilot.vim'
imap <script><silent><nowait><expr> <C-g> codeium#Accept()
imap <C-;>  <Cmd>call codeium#CycleCompletions(1)<CR>
imap <C-,>   <Cmd>call codeium#CycleCompletions(-1)<CR>
imap <C-x>   <Cmd>call codeium#Clear()<CR>

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" EVERYTHING BELOW IS NVIM SPECIFIC
" Run :PlugInstall each time

call plug#begin()
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'tpope/vim-fugitive'

" For vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

" For luasnip users.
" Plug 'L3MON4D3/LuaSnip'
" Plug 'saadparwaiz1/cmp_luasnip'

" For ultisnips users.
" Plug 'SirVer/ultisnips'
" Plug 'quangnguyen30192/cmp-nvim-ultisnips'

" For snippy users.
" Plug 'dcampos/nvim-snippy'
" Plug 'dcampos/cmp-snippy'
Plug 'nvim-lualine/lualine.nvim'

" Codeium
Plug 'Exafunction/codeium.vim'

Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
call plug#end()

set completeopt=menu,menuone,noselect

lua <<EOF
  -- Set up nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Set up lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  -- require('lspconfig').pyright.setup {
  --   capabilities = capabilities
  -- }
EOF

