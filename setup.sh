#!/bin/bash

# Symlink arg 1 from arg 2.
symlink () {
    [ -L $2 ] && (rm $2; echo "  rm $2"); ln -s $1 $2
    echo "  ln -s $1 $2"
}

# Symlink directory $1 from directory $2
symlink_dir () {
    [ -L $2 ] && (rm $2; echo "  rm $2"); ln -s $1 $2
    echo "  ln -s $1 $2"
}


if [[ $1 == 'local' ]]; then
    echo "Configuring for local shell."
elif [[ $1 == 'server' ]]; then
    echo "Configuring for server shell."
else
    echo "Usage: "
    echo "  ./setup.sh local   -- configure for OSX"
    echo "  ./setup.sh server  -- configure for linux server"
    echo "  ./setup.sh -h      -- this help message"
    exit
fi

# Pull vundle submodule
echo "Pulling configuration submodules..."
git submodule update --init --recursive

# Set up oh-my-zsh.
echo "Setting up oh-my-zsh..."
[ -d ~/.oh-my-zsh ] && (cd ~/.oh-my-zsh && git pull) || git clone git://github.com/wlue/oh-my-zsh.git ~/.oh-my-zsh

# bash/zsh
echo "Setting up symlinks..."
symlink "$(pwd)/bash_profile"   ~/.bash_profile
if [[ $1 == 'local' ]]; then
    symlink "$(pwd)/bash_aliases_osx"       ~/.bash_aliases
elif [[ $1 == 'server' ]]; then
    symlink "$(pwd)/bash_aliases_linux"     ~/.bash_aliases
fi
symlink "$(pwd)/bashrc"         ~/.bashrc
symlink "$(pwd)/zshrc"          ~/.zshrc
symlink "$(pwd)/tmux.conf"      ~/.tmux.conf

# vim
symlink_dir "$(pwd)/vim"        ~/.vim
symlink "$(pwd)/vimrc"          ~/.vimrc
if [[ $1 == 'local' ]]; then
    symlink "$(pwd)/xvimrc"     ~/.xvimrc
fi

# tmuxinator
symlink_dir "$(pwd)/tmuxinator"    ~/.tmuxinator

# git
symlink "$(pwd)/gitignore_global"       ~/.gitignore_global
if [[ $1 == 'local' ]]; then
    symlink "$(pwd)/gitconfig"          ~/.gitconfig
elif [[ $1 == 'server' ]]; then
    symlink "$(pwd)/gitconfig_server"   ~/.gitconfig
fi

symlink "$(pwd)/npmrc"          ~/.npmrc

echo "Done!"

