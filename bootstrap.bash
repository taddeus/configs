#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

ln -s -T $DIR/bashrc ~/.bashrc
ln -s -T $DIR/vimrc ~/.vimrc
ln -s -T $DIR/vim ~/.vim
