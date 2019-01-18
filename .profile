# If not running interactively, don't do anything
[ -z "$PS1" ] && return

if [ -f /usr/share/defaults/etc/profile ]; then
  source /usr/share/defaults/etc/profile
fi

# environment variables
## general
export PATH="$HOME/bin:$PATH"
export EDITOR=vim
export TERM=xterm-256color
export PS1="\[\e[1;34m\]\u\[\e[1;37m\]|\[\e[1;32m\]\w\[\e[33m\]\$(git-prompt.bash)\[\e[1;37m\]\$\[\e[m\] "
## clang
export CC=clang
export CXX=clang++
## go
export GOPATH="$HOME/src/go"
export PATH="$GOPATH/bin:$PATH"

# history
HISTSIZE=5000
HISTFILESIZE=10000
## don't put duplicate lines in the history.
HISTCONTROL=ignoredups
## append to the history file, don't overwrite it
shopt -s histappend

# aliases
## TODO: -G for color on BSD/MacOS
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -alF'
alias ls='ls --color=auto'

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

alias wget='wget -c'

# options
## disable ctrl-s and ctrl-q
stty -ixon
## cd without cd
shopt -s autocd
## check the window size after each command
shopt -s checkwinsize

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
