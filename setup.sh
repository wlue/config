#!/bin/bash

# Symlink arg 1 from arg 2.
symlink () {
    [ -e $2 ] && (rm $2; echo "  rm $2"); ln -s $1 $2
    echo "  ln -s $1 $2"
}

# Symlink directory $1 from directory $2
symlink_dir () {
    [ -d $2 ] && (rm $2; echo "  rm $2"); ln -s $1 $2
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

# Always use zsh if possible.
command -v zsh >/dev/null 2>&1 || { 
    echo "  zsh is not installed."
    exit 1; 
}

echo "  zsh installed!"
if [ -n "$ZSH_VERSION" ]; then
    chsh -s /bin/zsh
else
    echo "  zsh already being used."
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
symlink "$(pwd)/bashrc"         ~/.bashrc
symlink "$(pwd)/zshrc"          ~/.zshrc
symlink "$(pwd)/tmux.conf"      ~/.tmux.conf

# vim
symlink_dir "$(pwd)/vim"        ~/.vim
symlink "$(pwd)/vimrc"          ~/.vimrc
if [[ $1 == 'local' ]]; then
    symlink "$(pwd)/xvimrc"     ~/.xvimrc
fi

# git
symlink "$(pwd)/gitignore_global"       ~/.gitignore_global
if [[ $1 == 'local' ]]; then
    symlink "$(pwd)/gitconfig"          ~/.gitconfig
elif [[ $1 == 'server' ]]; then
    symlink "$(pwd)/gitconfig_server"   ~/.gitconfig
fi

echo "Done!"

