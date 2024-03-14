USE_POWERLINE="true"
HAS_WIDECHARS="false"

# Clang
export CC="clang"
export CXX="clang++"
# Go
export CGO_LDFLAGS=-fuse-ld=gold
export GOPATH="${HOME}/src/go"
export PATH="${GOPATH}/bin:${PATH}"
# Idris2
export PATH="${HOME}/.idris2/bin:${PATH}"
# JS
export PATH="${HOME}/.yarn/bin:${PATH}"
export PATH="/home/theodus/.local/share/fnm:$PATH"
eval "`fnm env`"
# Ocaml
if hash opam 2>/dev/null; then eval $(opam env); fi
# Pony
export PATH="${HOME}/.local/share/ponyup/bin:${PATH}"
# Solidity
export PATH="/home/theodus/.foundry/bin:${PATH}"

export EDITOR=nvim
export SHELL=/usr/bin/zsh

alias code=codium
alias la='ls -a'
alias ll='ls -lah'
