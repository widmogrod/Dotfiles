set nocompatible               " be iMproved
filetype off                   " required!

" Vundle - in case if VAM installation is not available
" I you will modified this, then run: vim +BundleInstall +qall
call vundle#rc("~/Dotfiles/vim/bundle")
Bundle 'gmarik/vundle'
Bundle 'chilicuil/nextCS'
Bundle 'altercation/vim-colors-solarized'
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'
Bundle 'xolox/vim-misc'
"Bundle 'Shougo/vimproc'
"Bundle 'Shougo/unite.vim'
Bundle 'shawncplus/phpcomplete.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'mhinz/vim-signify'
Bundle 'myusuf3/numbers.vim'
Bundle 'joonty/vim-taggatron'
Bundle 'bling/vim-airline'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'Raimondi/delimitMate'
Bundle 'SirVer/ultisnips'
Bundle 'joonty/vim-phpunitqf'
Bundle 'majutsushi/tagbar'
Bundle 'techlivezheng/vim-plugin-tagbar-phpctags'
Bundle 'beberlei/vim-php-refactor'
Bundle 'tomtom/tcomment_vim'
Bundle 'git://repo.or.cz/vcscommand'
"Bundle 'gcmt/tag-surfer'
"Bundle 'jelera/vim-javascript-syntax'
Bundle 'tpope/vim-unimpaired'
Bundle 'vim-scripts/bufkill.vim'
Bundle 'arnaud-lb/vim-php-namespace'
Bundle 'pangloss/vim-javascript'
Bundle 'tpope/vim-surround'
Bundle 'marijnh/tern_for_vim'
Bundle 'mileszs/ack.vim'

" Load additional project configuration
if v:version < 704
    so ~/Dotfiles/vimrc73
else
    so ~/Dotfiles/vimrc74
endif

" required!
filetype plugin indent on

let mapleader=';'
let g:tagbar_phpctags_bin='~/Dotfiles/bin/phpctags'
let g:tagbar_phpctags_memory_limit = '512M'

" General
" Remove all unwanted whitespaces on save
autocmd BufWritePre * :%s/\r\+$//e " Windows newlines
autocmd BufWritePre * :%s/\s\+$//e
" Clipboad as default set to +
set clipboard=unnamedplus
" Higlight current line
set cursorline
" When set allow switch between buffers even when buffer have change
set hidden
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
" Set line number
set number
" Set to auto read when a file is changed from the outside
set autoread
" Free the backspace and enable arrow keys and h l to move past the beginning
" and end of lines
set backspace=indent,eol,start
set whichwrap+=<,>,h,l
" Highlight search results
set hlsearch
" Show matching bracets when text indicator is over them
set showmatch
" Turn backup off
set nobackup
set nowb
set noswapfile
" Escape when double leader
imap <leader><leader> <ESC>

" Persistent undo
if version >= 703
    let ud=$HOME . "/.vimundo"

    if !isdirectory(ud)
        call mkdir(ud)
        echo "Created undo directory: " . ud
    endif

    execute "set undodir=" . ud
    set undofile
endif

set undolevels=1000


" Appearance
syntax enable
" set background=dark
"Uncomment this line if you are using iTerm
" let g:solarized_termcolors=256
" call togglebg#map("<F5>")
" colorscheme solarized


" Navigation
map } :bnext<CR>
map { :bprevious<CR>
nmap mj :m+1<CR>
nmap mk :m-2<CR>
" map <leader>. :CtrlPTag<CR>


" vim-airline
let g:airline#extensions#tabline#enabled = 1


" syntastic
let g:syntastic_always_populate_loc_list=1
let g:syntastic_php_checkers=['php', 'phpcs', 'phpmd']

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"


" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif


" NERDTree
map <leader>p :NERDTreeToggle<CR>
autocmd VimEnter * NERDTree    " Start NERDTree
autocmd VimEnter * wincmd l    " Active right window



" vim-multiple-cursors
" Default mapping
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'


" Tagbar
nnoremap <leader>i :TagbarToggle<CR>


" taggatron
"let g:taggatron_verbose = 1
let g:tagcommands = {
\    "php" : {
\        "tagfile" : ".php.tags",
\        "cmd"  : "~/Dotfiles/bin/phpctags",
\        "args" : "-R --fields=+lafmikS --sort=yes --memory=512M --exclude=vendor --exclude=build --exclude=library --exclude=.git --exclude=.svn",
\        "filesappend" : "/src"
\    },
\    "javascript" : {
\        "tagfile":".js.tags",
\        "cmd"  : "ctags",
\        "args":"-R"
\    }
\}


" vim-phpunitqf
let g:phpunit_cmd = "vendor/bin/phpunit"


" phpcomplete.vim
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
let g:phpcomplete_complete_for_unknown_classes = 0
let g:phpcomplete_parse_docblock_comments = 1


" php-refactor
let g:no_php_maps = 1
vmap <leader>em :call ExtractMethod()<CR>
nnoremap <leader>ev :call ExtractVariable()<CR>
nnoremap <leader>ep :call ExtractClassProperty()<CR>
nnoremap <leader>ei :call ExtractInterface()<CR>
nnoremap <leader>rlv :call RenameLocalVariable()<CR>
nnoremap <leader>rcv :call RenameClassVariable()<CR>
nnoremap <leader>iaf :call ImplementAbstractFunctions()<CR>


" tomtom/tcomment_vim"
map <leader>/ :TComment<CR>
map <leader>? :TCommentInline<CR>


" NERDTree
let g:NERDTreeMapJumpParent='h'

" Load additional project configuration
if filereadable(".vim.custom")
    so .vim.custom
endif

" BufKill
map <leader>q :bd<CR>
map <leader>Q :bd!<CR>

" vim-php-namespace
inoremap <Leader>u <C-O>:call PhpInsertUse()<CR>
noremap <Leader>u :call PhpInsertUse()<CR>

" tern
autocmd FileType javascript map <Leader>d :TernDef<CR>
