# zshrc
# Wen-Hao Lue

# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# set path
export PATH=/usr/local/sbin:/usr/local/bin:/usr/local/share/npm/bin:/usr/local/heroku/bin:/usr/texbin:/usr/sbin:/usr/bin:/sbin:/bin
export NODE_PATH=/usr/local/lib/node_modules

# Set name of the theme to load.
export ZSH_THEME="robbyrussell"

# Comment this out to disable weekly auto-update checks
export DISABLE_AUTO_UPDATE="true"

# Plugins (can be found in ~/.oh-my-zsh/plugins/*)
plugins=(git osx brew zsh-syntax-highlighting vagrant virtualenv pip)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
# [[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.

# Open GitHub pull request web interface.
git-pull-request () {
    open 'http://'$(git remote -v | awk -F'([@ :])|(\\.git)' '/fetch/ {print $2"/"$3}')'/pull/new/'$(git branch --no-color  | awk '/^\* / {print $2}')
}

# Create a new instance of Chrome using a temporary user data directory.
chrome () {
    app="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
    (
     ${app} --user-data-dir=$1 > /dev/null 2>&1;
     rm -r $1
    ) &
}

# Activate virtual environment.
venv () {
    source .venv/bin/activate
}

# List history matching regex.
h () {
    history | grep $* | sort -k2 | uniq -f 2 | sort -n | tail -n 10
}

# Open Xcode Projects quickly.
alias xo="open *.xcodeproj"

bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward

