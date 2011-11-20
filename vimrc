" This must be first, because it changes other options as a side effect.
set nocompatible

"Init of pathogen, must be called before filetype and syntax stuff
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

"Map the leader
let mapleader = ","

"Spell checking
" Toggle spell checking on and off
nmap <silent> <leader>s :set spell!<CR>
" Set region to British English
set spelllang=en_gb

"Map Esc Key to jk and kj, when in insert mode
inoremap jk <esc>
inoremap kj <esc>

"Fonts
set guifont=Menlo:h13

"Allows to hide buffers without saving
set hidden

"Relative Line numbers
set rnu

" Bubble single lines
nmap <C-k> [e
nmap <C-j> ]e
" Bubble multiple lines
vmap <C-k> [egv
vmap <C-j> ]egv

" Visually select the text that was last edited/pasted
nmap gV `[v`]

"Shortcuts for Tabs
"cmd plus number jumps to the specified tab
map <D-1> 1gt
map <D-2> 2gt
map <D-3> 3gt
map <D-4> 4gt
map <D-5> 5gt
map <D-6> 6gt
map <D-7> 7gt
map <D-8> 8gt
map <D-9> 9gt
map <D-0> :tablast<CR>
"remap the next, last tab 
"Maybe use D-left D-right instead? D-up/down jumps to start or end of page, not
map <D-up> gt
map <D-down> gT

" Display invisible characters
" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬


"Centralised Backup directory
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

"Displays command in the bottom right
set showcmd     "Display incomplete commands
set ruler       "Displays the line and column number of the cursor position
set incsearch   "Incremental search
set hlsearch    "Highlight search

"Correct indention replace tabs with spaces
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=8
set textwidth=79

"Move up and down a page
map <space> <c-f>
map <backspace> <c-b>

"Colorschemes
colorscheme blackboard

"open vimrc in a new tab
nmap <leader>v :tabedit $MYVIMRC<CR>


" Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

