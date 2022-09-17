#!/bin/sh

# Clang
export CC="clang"
export CXX="clang++"
# Go
export CGO_LDFLAGS=-fuse-ld=gold
# Idris2
export PATH="${HOME}/.idris2/bin:${PATH}"
# JS
export PATH="${HOME}/.yarn/bin:${PATH}"
source /usr/share/nvm/init-nvm.sh
# Ocaml
if hash opam 2>/dev/null; then eval $(opam env); fi
# Pony
export PATH="${HOME}/.local/share/ponyup/bin:${PATH}"
# Rust
. "${HOME}/.cargo/env"

export EDITOR=nvim
# export SHELL=/usr/bin/zsh
