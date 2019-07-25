#!/bin/zsh

# Install pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

#add Pathogen to ~/.vimrc
cat <<EOT>> ~/.vimrc
execute pathogen#infect()
set mouse=a
set number
syntax on
filetype plugin indent on
EOT

# Install vim-sensible
cd ~/.vim/bundle && \
git clone https://github.com/tpope/vim-sensible.git

# Install vim-go
git clone https://github.com/fatih/vim-go.git ~/.vim/bundle/vim-go

# Install NERD Tree
cd ~/.vim/bundle
git clone https://github.com/scrooloose/nerdtree

# Make sure nerdtree opens up if Vim is opened up with no file specified.
cat <<EOT>> ~/.vimrc
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
EOT

# Lets not forget youcompleteme
cd ~/.vim/bundle
git clone https://github.com/valloric/youcompleteme
# install all of the autocomplete syntax
cd ~/.vim/bundle/youcompleteme
./install.py --all
