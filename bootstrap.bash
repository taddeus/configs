#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

ln -s $DIR/bashrc ~/.bashrc
ln -s $DIR/vimrc ~/.vimrc
ln -sT $DIR/vim ~/.vim

. ~/.bashrc
