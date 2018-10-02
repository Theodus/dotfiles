# environment variables
## general
export PATH="$PATH":"$HOME/bin"
export EDITOR=vim
export TERM=xterm-256color
export PS1=$(bash_prompt)
## clang
export CC=clang
export CXX=clang++
## go
export GOPATH="$HOME/src/go"
export PATH="$PATH":"$GOPATH/bin"

# history
HISTSIZE=1000
HISTFILESIZE=2000
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

# disable ctrl-s and ctrl-q
stty -ixon

# cd without cd
shopt -s autocd

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
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
