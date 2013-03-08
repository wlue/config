# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# set path
export PATH=/opt/twitter/bin:/opt/twitter/sbin:/usr/local/git/bin:/usr/local/mysql/bin:/Users/wlue/bin:/Users/wlue/.twitools/src/twitter-utilities/sbt:/Users/wlue/.twitools/src/twitter-utilities/sbt11:/Users/wlue/.twitools/src/twitter-utilities/bin:$PATH

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="robbyrussell"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# export DISABLE_AUTO_TITLE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx brew zsh-syntax-highlighting vagrant virtualenv pip)

source $ZSH/oh-my-zsh.sh

# Twitter stuff
export JAVA_TOOL_OPTIONS="-Dfile.encoding=utf8"
export MAVEN_OPTS="-Xmx1024m -XX:MaxPermSize=128m"

# Customize to your needs...
# [[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.

git-pull-request () {
    open 'http://'$(git remote -v | awk -F'([@ :])|(\\.git)' '/fetch/ {print $2"/"$3}')'/pull/new/'$(git branch --no-color  | awk '/^\* / {print $2}')
}

venv () {
    source .venv/bin/activate
}

h () {
    history | grep $* | sort -k2 | uniq -f 2 | sort -n | tail -n 10
}

alias xo="open *.xcodeproj"

bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward



