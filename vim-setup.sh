# Set up package manager and color scheme
mkdir -p ~/.vim/bundle/ 
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone --depth=1 https://github.com/cocopon/iceberg.vim.git 

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
Plugin 'preservim/nerdtree'
Plugin 'tpope/vim-fugitive'

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
set clipboard=unnamedplus
set tabstop=2
set shiftwidth=2
set expandtab
set noshowmode
set laststatus=2
set ttimeout ttimeoutlen=50
colorscheme iceberg

let g:lightline = { 'colorscheme': 'iceberg' }
let g:gitgutter_async=0

" Nerdtree settings
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
EOF

# Install Vundle plugins
vim +PluginInstall +qall
