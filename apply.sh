#!/bin/sh
set -e -u

if !(nix-channel --list | grep unstable); then
  sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos
fi

sudo cp nixos/configuration.nix /etc/nixos/configuration.nix
sudo nixos-rebuild switch --upgrade

if [ ! -d "${HOME}/.tmux/plugins/tpm" ]; then
  git clone https://github.com/tmux-plugins/tpm "${HOME}/.tmux/plugins/tpm"
  echo "tmux: run prefix + I"
fi

rustup toolchain install stable
cargo install fnm

stow --target=$HOME configs
