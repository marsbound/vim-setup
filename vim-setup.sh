# Set up package manager and color scheme
mkdir -p ~/.vim/bundle/
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone --depth=1 https://github.com/cocopon/iceberg.vim.git
git clone --depth=1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all

mv iceberg.vim/src iceberg.vim/colors iceberg.vim/autoload ~/.vim/
rm -rf iceberg.vim

# Create vimrc and add default configurations
cat > ~/.vimrc << EOF
set nocompatible              " be iMproved, required
filetype off                  " required

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" Let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-surround'
Plugin 'airblade/vim-gitgutter'
Plugin 'itchyny/lightline.vim'
Plugin 'christoomey/vim-system-copy'
set rtp+=~/.fzf
Plugin 'junegunn/fzf.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

syntax on
set hlsearch
set incsearch
set relativenumber
set background=dark
set nu
set encoding=utf-8
if system('uname -s') == "Darwin\n"
  set clipboard=unnamed "OSX
else
  set clipboard=unnamedplus "Linux
endif
set tabstop=2
set shiftwidth=2
set expandtab
set noshowmode
set laststatus=2
set ttimeout ttimeoutlen=50
colorscheme iceberg

let g:lightline = { 'colorscheme': 'iceberg' }
let g:gitgutter_async=0
let g:fzf_layout = { 'down': '~20%' }
let g:fzf_preview_window = ''
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Key mappings
inoremap jk <ESC>
onoremap jk <ESC>
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-h> <C-W>h
nmap <C-l> <C-W>l
nnoremap <C-x> :Files<Cr>
EOF

# Install Vundle plugins
vim +PluginInstall +qall

