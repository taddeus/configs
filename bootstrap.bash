#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

sudo apt-get install -y git vim-nox

git submodule update --init

ln -sf $DIR/bashrc ~/.bashrc
ln -sf $DIR/vimrc ~/.vimrc
ln -sfT $DIR/vim ~/.vim
ln -sf $DIR/gitconfig ~/.gitconfig

source ~/.bashrc
