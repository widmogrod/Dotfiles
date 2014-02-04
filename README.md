# Dotfiles
## Installation

```
git clone git@github.com:widmogrod/Dotfiles.git && cd ~/Dotfiles && ./build
```

```
cd ~/Dotfiles/bash && ./vimproc.sh && ./vim-install-ycm.sh && ./install-composer.sh && ./install-php-libs.sh && sudo ./install-gem.sh
```
## Plugins
### VimDeck
To use this plugin you have to perform falowing steps:
 * run `./install-gem.js`
 * create presentation in markdown
 * run `vimdeck my.md`

## Shortcuts

### Usefull

```
<leader> = ;
```

```
mk - move line up
mj - move line donw
<leader>/ - toggle inline comment
<leader>? - toggle block comment
```

```
cs"' - change braces
cd'<p> - ....
```

```
<leader>q - kill buffer
<leader>Q - force kill buffer
```

### Context specific

```
<leader>t - tidy document
<leader>i - inspector
```

### JavaScript

```
<leader>d - go to definition
```

### Html
```
<c-y>, expand emmet
```

### PHP specific
Use statment:
```
inoremap <Leader>u <C-O>:call PhpInsertUse()<CR>
noremap <Leader>u :call PhpInsertUse()<CR>
```

Getters & setters
```
map <leader>gg  :InsertGetterOnly<CR>
map <leader>gs  :InsertSetterOnly<CR>
map <leader>ggs :InsertBothGetterSetter<CR>
```

Refactoring utils
```
vmap <leader>em :call ExtractMethod()<CR>
nnoremap <leader>ev :call ExtractVariable()<CR>
nnoremap <leader>ep :call ExtractClassProperty()<CR>
nnoremap <leader>ei :call ExtractInterface()<CR>
nnoremap <leader>rlv :call RenameLocalVariable()<CR>
nnoremap <leader>rcv :call RenameClassVariable()<CR>
nnoremap <leader>iaf :call ImplementAbstractFunctions()<CR>
```
