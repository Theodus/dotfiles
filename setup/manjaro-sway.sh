#!/bin/sh

. ./setup/common.sh

printf "[_] Install packages\n"
sudo sed -Ei '/EnableAUR/s/^#//' /etc/pamac.conf
sudo pacman -Syu && sudo pacman -Syyu
pamac install --no-confirm \
  base-devel clang cmake lld llvm llvm-libs \
  alacritty bottom docker git neovim nvm ripgrep shellcheck \
  nerd-fonts-jetbrains-mono ttf-juliamono \
  gammastep \
  brave-browser visual-studio-code-bin

sudo usermod -aG docker "${USER}"

printf "[_] Copy configs\n"
cp -rT configs "${HOME}"

printf "[_] Installing rustup\n"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
