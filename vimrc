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
Bundle 'joonty/vim-taggatron'
Bundle 'bling/vim-airline'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'vim-scripts/taglist.vim'
Bundle 'Raimondi/delimitMate'
Bundle 'SirVer/ultisnips'
Bundle 'Valloric/YouCompleteMe'
Bundle 'joonty/vim-phpunitqf'

" required!
filetype plugin indent on


" General
" Remove all unwanted whitespaces on save
"autocmd FileType php set omnifunc=phpcomplete#CompletePHP
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
" autocmd BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
autocmd TermResponse * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"


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


" taglist
" vertically split taglist window will appear on the left hand side
let Tlist_Use_Right_Window = 1
nnoremap <leader>i :TlistToggle<CR>


" taggatron
" let g:taggatron_verbose = 1
let g:tagcommands = {
\    "php" : {
\        "tagfile" : ".php.tags",
\        "cmd"  : "ctags",
\        "args" : "-R"
\    },
\    "javascript" : {
\        "tagfile":".js.tags",
\        "cmd"  : "ctags",
\        "args":"-R"
\    }
\}

" vim-phpunitqf
let g:phpunit_cmd = "vendor/bin/phpunit"
