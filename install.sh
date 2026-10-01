#!/usr/bin/env bash
set -euo pipefail

INSTALL_ALL=0
if [ "${1:-}" = "-a" ]; then INSTALL_ALL=1; fi

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if ! which git >/dev/null; then
    echo "Error: git is not installed"
    exit 1
fi

# git
git -C $DIR submodule update --init
ln -sf $DIR/gitconfig ~/.gitconfig

# bash
ln -sf $DIR/bashrc ~/.bashrc

# tmux
ln -sf $DIR/tmux.conf ~/.tmux.conf
if [ $INSTALL_ALL -eq 1 ]; then
    ln -sf $DIR/tmux.ssh-agent.conf ~/.tmux.ssh-agent.conf
fi

# vim
if which vim >/dev/null; then
    ln -sfT $DIR/vim ~/.vim
    ln -sf $DIR/vimrc ~/.vimrc
    vim +PluginClean! +PluginInstall +qall
fi
