# Set up package manager
mkdir -p ~/.vim/bundle/ ~/.vim/colors/
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
wget -P ~/.vim/colors/substrata.vim https://raw.githubusercontent.com/arzg/vim-substrata/master/colors/substrata.vim

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
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required
syntax on
set background=dark
set nu
set encoding=utf-8
set clipboard=unnamedplus
set tabstop=4
set shiftwidth=4
set expandtab

colorscheme substrata

EOF

# Install Vundle plugins
vim +PluginInstall +qall
