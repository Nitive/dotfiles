if !exists('g:vscode')
let mapleader = ','

call plug#begin('~/.vim/plugged')
" -- Linters
Plug 'neomake/neomake'
" let g:neomake_javascript_eslint_exe = $PWD .'/node_modules/.bin/eslint'
" let g:neomake_javascript_enabled_makers = ['eslint']
autocmd! BufWritePost * Neomake

" File manager
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
nmap <leader><leader> :NERDTreeFind<CR>

" Search in project
Plug 'mileszs/ack.vim'

" Remove/replace parens
Plug 'tpope/vim-surround'

" Get statistic of coding time
Plug 'wakatime/vim-wakatime'

" -- Langs
" JavaScript
Plug 'neovim/node-host', { 'do': 'npm install' }
Plug 'billyvg/tigris.nvim', { 'do': './install.sh' }
let g:tigris#enabled = 1

" Erlang
Plug 'vim-erlang/vim-erlang-runtime'
Plug 'vim-erlang/vim-erlang-compiler'
Plug 'vim-erlang/vim-erlang-omnicomplete'
Plug 'vim-erlang/vim-erlang-tags'

" Add smart commands for comments like:
" gcc - Toggle comment for the current line
" gc  - Toggle comments for selected region or number of strings
" Very usefull
Plug 'tomtom/tcomment_vim'

" Clojure
Plug 'tpope/vim-fireplace'
Plug 'venantius/vim-cljfmt'
nmap gd [<C-D>
nmap gb <C-O>

" -- Colors

Plug 'joshdick/onedark.vim'
set background=dark
let g:onedark_terminal_italics = 1

call plug#end()

" Reload config
nmap R :source $MYVIMRC<CR>

" Map arrows
imap <C-f> <Right>
imap <C-b> <Left>

" save file with root privileges
command! -nargs=0 -bang WSudo :silent! w !sudo tee % &>/dev/null

set relativenumber
set expandtab
set shiftwidth=2
colorscheme onedark

" -- Persistent Undo
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo')
  silent !mkdir ~/.config/nvim/backups > /dev/null 2>&1
  set undodir=~/.config/nvim/backups
  set undofile
endif

" Russian lang in insert mode
" Use Ctrl+^ to switch keyboard layout
set keymap=russian-dvorak
set iminsert=0
set imsearch=0
endif
