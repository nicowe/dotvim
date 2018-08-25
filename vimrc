" This must be first, because it changes other options as a side effect.
set nocompatible

"Init of pathogen, must be called before filetype and syntax stuff
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" # Appearance
set background=dark
colorscheme blackboard

"Map the leader
let mapleader = "\<Space>"
let maplocalleader = ","

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

" Bubble single lines
nmap <C-k> [e
nmap <C-j> ]e
" Bubble multiple lines
vmap <C-k> [egv
vmap <C-j> ]egv

" Display invisible characters
" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
map <leader>n :NERDTree<CR>

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
"TODO: Should be set depending on the file
set expandtab
set smarttab    "Use shiftwidth, when tab is applied at the start of a line
set shiftwidth=4
set softtabstop=4
set tabstop=8
set textwidth=79
set autoindent

"open vimrc in a new tab
nmap <leader>v :tabedit $MYVIMRC<CR>

" Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
let s:opam_share_dir = system("opam config var share")
let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

let s:opam_configuration = {}

function! OpamConfOcpIndent()
  execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
endfunction
let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

function! OpamConfOcpIndex()
  execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
endfunction
let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

function! OpamConfMerlin()
  let l:dir = s:opam_share_dir . "/merlin/vim"
  execute "set rtp+=" . l:dir
endfunction
let s:opam_configuration['merlin'] = function('OpamConfMerlin')

let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
for tool in s:opam_packages
  " Respect package order (merlin should be after ocp-index)
  if count(s:opam_available_tools, tool) > 0
    call s:opam_configuration[tool]()
  endif
endfor
" ## end of OPAM user-setup addition for vim / base ## keep this line

