# Use powerline
USE_POWERLINE="true"
# Has weird character width
# Example:
#    is not a diamond
HAS_WIDECHARS="false"
# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi

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
export PATH="/home/theodus/.bun/bin:$PATH"
export PATH="${HOME}/.yarn/bin:${PATH}"
export PATH="/home/theodus/.local/share/fnm:$PATH"
eval "`fnm env`"
# Ocaml
if hash opam 2>/dev/null; then eval $(opam env); fi
# Pony
export PATH="${HOME}/.local/share/ponyup/bin:${PATH}"
# Rust
. "${HOME}/.cargo/env"
# Solidity
export PATH="/home/theodus/.foundry/bin:${PATH}"

export EDITOR=helix
export SHELL=/usr/bin/zsh

alias la='ls -a'
alias ll='ls -lah'
