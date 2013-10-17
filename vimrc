set nocompatible               " be iMproved
filetype off                   " required!

" Vundle - in case if VAM installation is not available
" I you will modified this, then run: vim +BundleInstall +qall
call vundle#rc("~/Dotfiles/vim/bundle")
Bundle 'gmarik/vundle'
Bundle 'altercation/vim-colors-solarized'
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'
Bundle 'xolox/vim-misc'
Bundle 'shawncplus/phpcomplete.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'mhinz/vim-signify'
Bundle 'myusuf3/numbers.vim'
"Bundle 'ervandew/supertab'
Bundle 'joonty/vim-taggatron'

Bundle 'bling/vim-airline'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'vim-scripts/taglist.vim'
Bundle 'Raimondi/delimitMate'
Bundle 'Valloric/YouCompleteMe'

Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle 'garbas/vim-snipmate'
Bundle 'honza/vim-snippets'
Bundle 'joonty/vim-phpunitqf'

" required!
filetype plugin indent on


" General
" Remove all unwanted whitespaces on save
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd BufWritePre * :%s/\r\+$//e " Windows newlines
autocmd BufWritePre * :%s/\s\+$//e
" Indent the next line similiar to current line
set autoindent
" Use same indentation characters as current line
set copyindent
" Use spaces instead of tabs for indentation
set expandtab
" Use 4 spaces for indentation
set shiftwidth=4
" Round all indentations to multiple of shiftwidth
set shiftround
" Set tabs to be equivalent to 4 spaces (fixes retab)
set tabstop=4

" Appearance
syntax enable
set background=dark
let g:solarized_termcolors=256
colorscheme solarized

" Navigation
map } :bnext<CR>
map { :bprevious<CR>
" map <leader>. :CtrlPTag<CR>

" vim-airline
let g:airline#extensions#tabline#enabled = 1

" syntastic
let g:syntastic_always_populate_loc_list=1
let g:syntastic_php_checkers=['php', 'phpcs', 'phpmd']

" NERDTree
map <leader>p :NERDTreeToggle<CR>
" Open a NERDTree automatically when vim starts up
autocmd vimenter * if !argc() | NERDTree | endif


" vim-multiple-cursors
" Default mapping
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" taglist
" vertically split taglist window will appear on the left hand side
let Tlist_Use_Right_Window = 1
nnoremap <leader>i :TlistToggle<CR>

"/vim-easytags
"set tags=./tags;
"let g:easytags_by_filetype = './tags'
"let g:easytags_dynamic_files = 1

" taggatron
" let g:taggatron_verbose = 1
let g:tagcommands = {
\    "php" : {
\        "tagfile" : ".php.tags",
\        "cmd"  : "ctags",
\        "args" : "-R --tag-relative=yes --exclude=.git --regex-php='/^[ \t]*trait[ \t]+([a-z0_9_]+)/\1/t,traits/i' --regex-PHP='^namespace\s+([^;]*)/\1/c/'"
\    },
\    "javascript" : {
\        "tagfile":".js.tags",
\        "cmd"  : "ctags",
\        "args":"-R"
\    }
\}

" vim-phpunitqf
let g:phpunit_cmd = "vendor/bin/phpunit"
