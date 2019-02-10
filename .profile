# If not running interactively, don't do anything
[ -z "$PS1" ] && return

if [ -r /usr/share/defaults/etc/profile ]; then
  . /usr/share/defaults/etc/profile
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
# better yaourt colors
export YAOURT_COLORS="nb=1:pkg=1:ver=1;32:lver=1;45:installed=1;42:grp=1;34:od=1;41;5:votes=1;44:dsc=0:other=1;35"

# aliases
## TODO: -G for color on BSD/MacOS
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -alF'
alias ls='ls --color=auto'

alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias more=less

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

alias wget='wget -c'

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

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -r /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -r /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
