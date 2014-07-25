set nocompatible               " be iMproved
filetype off                   " required!

" Vundle - in case if VAM installation is not available
" I you will modified this, then run: vim +BundleInstall +qall
call vundle#rc("~/Dotfiles/vim/bundle")
Bundle 'gmarik/vundle'
" Change your vim color scheme easily F11 F12
Bundle 'chilicuil/nextCS'
" May very well be the best Git wrapper
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'
Bundle 'xolox/vim-misc'
Bundle 'shawncplus/phpcomplete.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'ervandew/supertab'
" Show a VCS diff using Vim's sign column.
Bundle 'mhinz/vim-signify'
" A Vim plugin which shows a git diff in the gutter (sign column) and stages/reverts hunks.
Bundle 'airblade/vim-gitgutter'
Bundle 'myusuf3/numbers.vim'
Bundle 'joonty/vim-taggatron'
Bundle 'bling/vim-airline'
Bundle 'terryma/vim-multiple-cursors'
" Vim plugin, provides insert mode auto-completion for quotes, parens, brackets, etc.
Bundle 'Raimondi/delimitMate'
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
" Bundle 'joonty/vim-phpunitqf'
Bundle 'majutsushi/tagbar'
Bundle 'techlivezheng/vim-plugin-tagbar-phpctags'
Bundle 'beberlei/vim-php-refactor'
" An extensible & universal comment vim-plugin that also handles embedded filetypes
Bundle 'tomtom/tcomment_vim'
Bundle 'vim-scripts/vcscommand.vim'
" Add keymapings for []
Bundle 'tpope/vim-unimpaired'
" Unload/delete/wipe a buffer, keep its window(s), display last accessed buffer(s)
Bundle 'vim-scripts/bufkill.vim'
" types 'use' statements for you
Bundle 'arnaud-lb/vim-php-namespace'
" Vastly improved Javascript indentation and syntax support in Vim.
Bundle 'pangloss/vim-javascript'
" Change \" -> ' by: cs\"'
Bundle 'tpope/vim-surround'
Bundle 'marijnh/tern_for_vim'
Bundle 'mileszs/ack.vim'
" Vim Outliner of Markers <leader>i
Bundle 'vim-scripts/VOoM'
Bundle 'docteurklein/php-getter-setter.vim'
" ZenCodding like <c-y>,
Bundle 'mattn/emmet-vim'
" Gitk for VIM :Gitv
Bundle 'gregsexton/gitv'
" Create gist from current buffer :Gist (anonymous :Gist -a)
Bundle 'mattn/gist-vim'
" A fancy start screen for Vim.
Bundle 'mhinz/vim-startify'
" :UndotreeToggle
Bundle 'mbbill/undotree'
" With Wildfire you can quickly select the closest text object among a group of candidates
Bundle 'gcmt/wildfire.vim'
Bundle 'zenorocha/dracula-theme'
" PHP
Bundle 'veloce/vim-behat'
" Jade
Bundle 'coachshea/jade-vim'
" Allow to align text by certain rules
Bundle 'godlygeek/tabular'
" Enable ZEN like mode
Bundle 'junegunn/goyo.vim'
" UML
" \di to start DrawIt and
" \ds to stop  DrawIt.
Bundle 'vim-scripts/DrawIt'
" Bettter PHP syntax 5.6
Bundle 'StanAngeloff/php.vim'

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
" set clipboard=unnamedplus
" Higlight current line
set cursorline
" When set allow switch between buffers even when buffer have change
set hidden
" Indent the next line similiar to current line
set autoindent
" Be smart with indent
set smartindent
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
"  Search before hit enter
set incsearch
" Show available commands in list
set wildmenu
" set paste cinflicts with YCM
" set paste
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
colorscheme dracula
" fix bacground color for dracula-theme
hi Normal ctermfg=231 ctermbg=NONE cterm=NONE guifg=#f8f8f2 guibg=#282a36 gui=NONE

" Navigation
map } :bnext<CR>
map { :bprevious<CR>
map L :bnext<CR>
map H :bprevious<CR>
nmap mj :m+1<CR>
nmap mk :m-2<CR>
" map <leader>. :CtrlPTag<CR>


" vim-airline
let g:airline#extensions#tabline#enabled = 1
" let g:airline_powerline_fonts = 1
set laststatus=2


" syntastic
let g:syntastic_always_populate_loc_list=1
let g:syntastic_php_checkers=['php', 'phpcs', 'phpmd']
let g:syntastic_javascript_checkers=['jslint']

" YCM
let g:ycm_use_ultisnips_completer = 1
let g:ycm_key_list_select_completion = ['<tab>', '<down>', '<enter>']
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>""


" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif


" NERDTree
map <leader>p :NERDTreeToggle<CR>
" autocmd VimEnter * NERDTree    " Start NERDTree
" autocmd VimEnter * wincmd l    " Active right window



" vim-multiple-cursors
" Default mapping
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'


" Tagbar
autocmd FileType php nnoremap <leader>i :TagbarToggle<CR>

" Voom
autocmd FileType rst nnoremap <leader>i :Voom rest<CR>
autocmd FileType md nnoremap <leader>i :Voom markdown<CR>
autocmd FileType markdown nnoremap <leader>i :Voom markdown<CR>
autocmd FileType mdown nnoremap <leader>i :Voom markdown<CR>


" taggatron
" let g:taggatron_verbose = 1
let g:taggatron_enabled = 1
let g:tagcommands = {
\    "php" : {
\        "tagfile" : ".php.tags",
\        "cmd"  : "~/Dotfiles/bin/phpctags",
\        "args" : "--recurse=yes --memory=-1 --fields=+tcmfpdvin --exclude=vendor"
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

" php-get-set
map <leader>gg  :InsertGetterOnly<CR>
map <leader>gs  :InsertSetterOnly<CR>
map <leader>ggs :InsertBothGetterSetter<CR>

" tidy content
autocmd Syntax xml nmap <leader>t :.,%!xmllint --format --recover -<CR>

" emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
" let g:user_emmet_leader_key='<C-Z>'

" startify
let g:startify_custom_header=map(split(system('fortune | cowsay'), '\n'), '"   ". v:val') + ['','']

" behat
let g:feature_filetype='behat'
let g:behat_executables = ['./vendor/bin/behat']

let g:numbers_exclude = ['unite', 'tagbar', 'startify', 'gundo', 'vimshell', 'w3m', 'goyo']
