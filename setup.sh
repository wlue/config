#!/bin/bash

# bash/zsh
ln -s .bashrc ~/.bashrc
ln -s .bash_profile ~/.bash_profile
ln -s .zshrc ~/.zshrc
ln -s .tmux.conf ~/.tmux.conf

# vim
ln -s .vimrc ~/.vimrc
ln -s .xvimrc ~/.xvimrc
ln -s .vim/ ~/.vim

git submodule update --init --recursive     # Pull vundle submodule

# git
ln -s .gitconfig ~/.gitconfig
ln -s .gitignore_global ~/.gitignore_global

