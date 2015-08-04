#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

git submodule update --init

ln -sf $DIR/bashrc ~/.bashrc
ln -sf $DIR/vimrc_plugins ~/.vimrc
ln -sfT $DIR/vim ~/.vim
ln -sf $DIR/gitconfig ~/.gitconfig

source ~/.bashrc

sudo apt-get install -y build-essential cmake python-dev
vim +PluginInstall +qall
cd $DIR/vim/bundle/YouCompleteMe && ./install.sh
