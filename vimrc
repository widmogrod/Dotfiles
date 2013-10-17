set nocompatible               " be iMproved
filetype off                   " required!

" Vundle - in case if VAM installation is not available
" I you will modified this, then run: vim +BundleInstall +qall
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'altercation/vim-colors-solarized'
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'
Bundle 'Townk/vim-autoclose'
Bundle 'xolox/vim-misc'
"Bundle 'xolox/vim-easytags'
Bundle 'shawncplus/phpcomplete.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'mhinz/vim-signify'

" required!
filetype plugin indent on


" VAM - vim addon manager - prefered way of installation
call vam#ActivateAddons([])
ActivateAddons vim-snippets
ActivateAddons vim-airline
ActivateAddons vim-multiple-cursors
ActivateAddons taglist
" ActivateAddons vim-javascript


" Appearance
syntax enable
set background=dark
let g:solarized_termcolors=256
colorscheme solarized

" Navigation
map } :bnext<CR>
map { :bprevious<CR>
" map <leader>. :CtrlPTag<CR>
map <C-[> :pop<CR>

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
set tags=./tags;
"let g:easytags_by_filetype = './tags'
let g:easytags_dynamic_files = 1



