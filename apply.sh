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

cargo install fnm cargo-watch

if [ ! -d "${HOME}/.tmux/plugins/tpm" ]; then
  git clone https://github.com/tmux-plugins/tpm "${HOME}/.tmux/plugins/tpm"
  echo "tmux: run prefix + I"
fi

stow --target=$HOME configs
