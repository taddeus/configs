#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

git submodule update --init

ln -s $DIR/bashrc ~/.bashrc
ln -s $DIR/vimrc_plugins ~/.vimrc
ln -sT $DIR/vim ~/.vim
ln -s $DIR/gitignore ~/.gitignore

source ~/.bashrc

vim +PluginInstall +qall
cd $DIR/vim/bundle/YouCompleteMe && ./install.sh
