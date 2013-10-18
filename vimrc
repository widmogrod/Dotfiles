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
Bundle 'Valloric/YouCompleteMe'
Bundle 'joonty/vim-phpunitqf'
Bundle 'majutsushi/tagbar'
Bundle 'techlivezheng/vim-plugin-tagbar-phpctags'
Bundle 'beberlei/vim-php-refactor'
Bundle 'tomtom/tcomment_vim'

" required!
filetype plugin indent on


let g:tagbar_phpctags_bin='~/Dotfiles/bin/phpctags'
let g:tagbar_phpctags_memory_limit = '512M'


" General
" Remove all unwanted whitespaces on save
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
set background=dark
let g:solarized_termcolors=256
colorscheme solarized

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


" YCM + UltiSnips
" UltiSnips completion function that tries to expand a snippet. If there's no
" snippet for expanding, it checks for completion window and if it's
" shown, selects first element. If there's no completion window it tries to
" jump to next placeholder. If there's no placeholder it just returns TAB key
function! g:UltiSnips_Complete()
    call UltiSnips_ExpandSnippet()
    if g:ulti_expand_res == 0
        if pumvisible()
            return "\<C-n>"
        else
            call UltiSnips_JumpForwards()
            if g:ulti_jump_forwards_res == 0
               return "\<TAB>"
            endif
        endif
    endif
    return ""
endfunction

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Complete snipped when using YCM
autocmd TermResponse * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"

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
\        "args" : "-R --fields=+afmikS --sort=yes --memory=512M --exclude=vendor --exclude=build --exclude=library --exclude=.git --exclude=.svn",
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
autocmd  FileType  php setlocal omnifunc=phpcomplete#CompletePHP
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
