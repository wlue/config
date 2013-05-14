#!/bin/bash

# bash/zsh
ln -s -f .wlue.config/.bashrc ~/.bashrc
ln -s -f .wlue.config/.bash_profile ~/.bash_profile
ln -s -f .wlue.config/.zshrc ~/.zshrc
ln -s -f .wlue.config/.tmux.conf ~/.tmux.conf

# vim
ln -s -f .wlue.config/.vimrc ~/.vimrc

rm ~/.vim
ln -s -f .wlue.config/.vim/ ~/.vim

# Pull vundle submodule
git submodule update --init --recursive

# git
ln -s -f .wlue.config/.gitconfig_server ~/.gitconfig
ln -s -f .wlue.config/.gitignore_global ~/.gitignore_global

