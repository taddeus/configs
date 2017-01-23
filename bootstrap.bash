#!/usr/bin/env bash
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if ! which git >/dev/null; then
    echo "Error: git is not installed"
    exit 1
fi

# git
git submodule update --init
ln -sf $DIR/gitconfig ~/.gitconfig

# bash
ln -sf $DIR/bashrc ~/.bashrc
source ~/.bashrc

# vim
if which vim >/dev/null; then
    ln -sfT $DIR/vim ~/.vim
    ln -sf $DIR/vimrc ~/.vimrc
    vim +PluginInstall +qall
fi
