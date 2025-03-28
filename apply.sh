#!/bin/sh
set -e -u

sudo pacman -Syu && sudo pacman -Syyu
pamac install --no-confirm \
  base-devel clang cmake lld llvm llvm-libs \
  libsecret openssh \
  alacritty bottom docker docker-compose git jq neovim ripgrep shellcheck stow tmux zsh \
  ttf-juliamono \
  brave-browser vscodium

sudo systemctl enable docker
sudo usermod -a -G docker "${USER}"
# chsh -s /usr/bin/zsh "${USER}"

if ! command -v rustup; then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

source $HOME/.cargo/env
cargo install fnm cargo-watch

stow --target=$HOME configs
