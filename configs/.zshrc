# Use powerline
USE_POWERLINE="true"
# Has weird character width
# Example:
#    is not a diamond
HAS_WIDECHARS="true"
# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi

export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/ssh-agent.socket"

# Clang
export CC="clang"
export CXX="clang++"
# Go
export CGO_LDFLAGS=-fuse-ld=gold
export GOPATH="${HOME}/src/go"
export PATH="${GOPATH}/bin:${PATH}"
# Idris2
export PATH="${HOME}/.idris2/bin:${PATH}"
# Rust
. $HOME/.cargo/env
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
