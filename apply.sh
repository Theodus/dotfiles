#!/bin/sh
set -e -u

sudo pacman -Syu && sudo pacman -Syyu
pamac install --no-confirm \
  base-devel clang cmake lld llvm llvm-libs \
  bottom docker docker-compose git helix jq ripgrep stow zsh \
  ttf-juliamono \
  brave-browser

sudo systemctl enable docker
sudo usermod -a -G docker "${USER}"
# chsh -s /usr/bin/zsh "${USER}"

if ! command -v rustup; then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

source $HOME/.cargo/env
rustup component add rust-analyzer
cargo install cargo-shear cargo-watch fnm

stow --target=$HOME configs
