# zshrc
# Wen-Hao Lue

# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# set path
export PATH=/usr/local/sbin:/usr/local/bin:/usr/local/share/npm/bin:/usr/local/heroku/bin:/usr/texbin:/usr/sbin:/usr/bin:/sbin:/bin:$PATH
export NODE_PATH=/usr/local/lib/node_modules

# Set name of the theme to load.
export ZSH_THEME="robbyrussell"

# Comment this out to disable weekly auto-update checks
export DISABLE_AUTO_UPDATE="true"

# Don't make tmux change titles.
export DISABLE_AUTO_TITLE="true"
export EDITOR="vim"

# Plugins (can be found in ~/.oh-my-zsh/plugins/*)
plugins=(git osx brew zsh-syntax-highlighting vagrant virtualenv pip)

source $ZSH/oh-my-zsh.sh

# autojump
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

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
alias wo="open *.xcworkspace"

bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward

# rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

