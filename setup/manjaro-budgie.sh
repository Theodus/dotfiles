#!/bin/sh

. ./setup/common.sh

printf "[_] Install packages\n"
sudo sed -Ei '/EnableAUR/s/^#//' /etc/pamac.conf
sudo pacman -Syu && sudo pacman -Syyu
pamac install --no-confirm \
  base-devel clang cmake lld llvm llvm-libs \
  alacritty bottom docker git neovim ripgrep shellcheck zsh \
  ttf-jetbrains-mono-nerd ttf-juliamono \
  brave-browser code
sudo usermod -a -G docker "${USER}"

printf "[_] Installing rustup\n"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

printf "[_] Copy configs\n"
cp -rT configs "${HOME}"

printf "[_] configure shell\n"
chsh -s /usr/bin/zsh "${USER}"

printf "[_] Reloading .profile\n"
. "${HOME}/.profile"
