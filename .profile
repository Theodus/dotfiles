# If not running interactively, don't do anything
[ -z "$PS1" ] && return

if [ -r /usr/share/defaults/etc/profile ]; then
  . /usr/share/defaults/etc/profile
fi

# environment variables
## general
export PATH="$HOME/bin:$PATH"
export EDITOR="nvim"
export TERM="xterm-256color"
export PS1="\[\e[1;34m\]\u\[\e[1;37m\]|\[\e[1;32m\]\w\[\e[33m\]\$(git-prompt.bash)\[\e[1;37m\]\$\[\e[m\] "
## pony
export PATH="$HOME/.pony/ponyup/bin:$PATH"
## clang
export CC="clang"
export CXX="clang++"
## go
export GOPATH="$HOME/src/go"
export PATH="$GOPATH/bin:$PATH"
export CGO_LDFLAGS=-fuse-ld=gold
## idris2
export PATH="$HOME/.idris2/bin:$PATH"
## better yaourt colors
export YAOURT_COLORS="nb=1:pkg=1:ver=1;32:lver=1;45:installed=1;42:grp=1;34:od=1;41;5:votes=1;44:dsc=0:other=1;35"

# aliases
## TODO: -G for color on BSD/MacOS
alias l="ls -CF"
alias la="ls -A"
alias ll="ls -alhF"
alias ls="ls --color=auto"

## confirm before overwriting something
alias cp="cp -i"
## human-readable sizes
alias df="df -h"
## show sizes in MB
alias free="free -m"

alias more="less"

alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"

alias wget="wget -c"

alias vim="nvim"

complete -cf sudo

# history
HISTSIZE=5000
HISTFILESIZE=10000
## don't put duplicate lines in the history.
HISTCONTROL=ignoredups
## append to the history file, don't overwrite it
shopt -s histappend

# options
## disable ctrl-s and ctrl-q
stty -ixon
## cd without cd
shopt -s autocd
## check the window size after each command
shopt -s checkwinsize

# enable programmable completion features
if ! shopt -oq posix; then
  if [ -r /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -r /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
