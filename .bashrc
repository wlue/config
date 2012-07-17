
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

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

	# Homebrew apps higher priority
	export PATH=/usr/local/bin:/usr/local/sbin:$PATH:~/prgm/web/sites/libs/lithium/libraries/lithium/console

	# Brew by Gems
	export GEM_HOME='/usr/local/Cellar/gems/1.8'

	export PS1="  \[\e[32;1m\]\u\[\e[0m\]\[\e[32m\]@\h\[\e[36m\]\w \[\e[33m\]\$ \[\e[0m\]"
	# export CLICOLOR=1
	# export LSCOLORS=gxfxcxdxbxegedabagacad

	export LS_OPTIONS='--color=auto'
	alias ls='gls $LS_OPTIONS -hF'
	alias xo='open *.xcodeproj'

	# eval `gdircolors ~/.dir_colors`

	# Alias definitions.
	# You may want to put all your additions into a separate file like
	# ~/.bash_aliases, instead of adding them here directly.
	# See /usr/share/doc/bash-doc/examples in the bash-doc package.

	if [ -f ~/.bash_aliases ]; then
		. ~/.bash_aliases
	fi

	if [ -f `brew --prefix`/etc/bash_completion ]; then
		. `brew --prefix`/etc/bash_completion
	fi
	

	# source default system-wide profile
	#source /etc/profile

	# cs241 stuff
	# export "CLASSPATH=.:/Users/wlue/prgm/uw/classes:$CLASSPATH"
fi

# RVM configuration
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.

