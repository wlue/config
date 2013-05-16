#!/bin/bash

if [[ $1 == 'local' ]]; then
    echo "Configuring for OSX shell."
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
    echo "  \033[0;33mAre you sure you have installed zsh?\033[0m"
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
[ -d ~/.oh-my-zsh ] && (cd ~/.oh-my-zsh && git pull) || git clone git@github.com:wlue/oh-my-zsh.git ~/.oh-my-zsh

# bash/zsh
echo "Setting up symlinks..."
ln -s -f .wlue.config/.bashrc ~/.bashrc
ln -s -f .wlue.config/.bash_profile ~/.bash_profile
ln -s -f .wlue.config/.zshrc ~/.zshrc
ln -s -f .wlue.config/.tmux.conf ~/.tmux.conf

# vim
ln -s -f .wlue.config/.vimrc ~/.vimrc

if [[ $1 == 'local' ]]; then
    ln -s -f .wlue.config/.xvimrc ~/.xvimrc
fi

rm ~/.vim
ln -s -f .wlue.config/.vim/ ~/.vim

# git
ln -s -f .wlue.config/.gitignore_global ~/.gitignore_global
if [[ $1 == 'local' ]]; then
    ln -s -f .wlue.config/.gitconfig ~/.gitconfig
elif [[ $1 == 'server' ]]; then
    ln -s -f .wlue.config/.gitconfig_server ~/.gitconfig
fi

echo "Done!"

