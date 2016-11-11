#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source $DIR/bootstrap.bash

ln -sf $DIR/vimrc_plugins ~/.vimrc

sudo apt-get install -y build-essential cmake python-dev

vim +PluginInstall +qall
cd $DIR/vim/bundle/YouCompleteMe && ./install.sh
