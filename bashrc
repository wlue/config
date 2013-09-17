# bashrc
# Wen-Hao Lue

# If not running interactively, don't do anything
if [[ -n "$PS1" ]]; then

    # don't put duplicate lines in the history. See bash(1) for more options
    # don't overwrite GNU Midnight Commander's setting of `ignorespace'.
    export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups

    # ... or force ignoredups and ignorespace
    export HISTCONTROL=ignoreboth

    # append to the history file, don't overwrite it
    shopt -s histappend

    # check the window size after each command and, if necessary,
    # update the values of LINES and COLUMNS.
    shopt -s checkwinsize

    # set a fancy prompt (non-color, unless we know we "want" color)
    case "$TERM" in
        xterm-color) color_prompt=yes;;
    esac

    export PS1="  \[\e[32;1m\]\u\[\e[0m\]\[\e[32m\]@\h\[\e[36m\]\w \[\e[33m\]\$ \[\e[0m\]"
    export CLICOLOR=1
    export EDITOR='vim'

    # Alias definitions.
    if [ -f ~/.bash_aliases ]; then
        . ~/.bash_aliases
    fi
fi


PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
