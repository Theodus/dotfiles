# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -r /usr/share/defaults/etc/profile ]; then
  . /usr/share/defaults/etc/profile
fi

# environment variables
## general
export PATH="$HOME/bin:$PATH"
if [ "$TERM" != linux ]; then export TERM="xterm-256color"; fi
export EDITOR="nvim"
## pony
export PATH="$HOME/.local/share/ponyup/bin:$PATH"
## clang
export CC="clang"
export CXX="clang++"
## go
export GOPATH="$HOME/src/go"
export PATH="$GOPATH/bin:$PATH"
export CGO_LDFLAGS=-fuse-ld=gold
## rust
export PATH="/home/theodus/.cargo/bin:$PATH"
## idris2
export PATH="$HOME/.idris2/bin:$PATH"
## ocaml
if hash opam 2>/dev/null; then eval $(opam env); fi
## f*
export FSTAR_HOME="$HOME/src/theodus/FStar"
export KREMLIN_HOME="$HOME/src/theodus/kremlin"
export PATH="$FSTAR_HOME/bin:$KREMLIN_HOME:$PATH"
## firrtl
export PATH="$HOME/src/freechipsproject/firrtl/utils/bin:$PATH"
## better yaourt colors
export YAOURT_COLORS="nb=1:pkg=1:ver=1;32:lver=1;45:installed=1;42:grp=1;34:od=1;41;5:votes=1;44:dsc=0:other=1;35"

# aliases
alias more="less"
alias wget="wget -c"
## ls
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
## grep
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"

complete -cf sudo

# options
## cd without cd
shopt -s autocd
## check the window size after each command
shopt -s checkwinsize
# history
export HISTSIZE=5000
export HISTFILESIZE=10000
## don't put duplicate lines in the history.
export HISTCONTROL=ignoredups
## append to the history file, don't overwrite it
shopt -s histappend

