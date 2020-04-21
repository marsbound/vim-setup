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

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-surround'
Plugin 'airblade/vim-gitgutter'
Plugin 'itchyny/lightline.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

syntax on
set hlsearch
set incsearch
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

EOF

# Install Vundle plugins
vim +PluginInstall +qall
