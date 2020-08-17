#!/bin/sh

require() {
  err=false
  for cmd in "$@"; do
    if ! command -v "$cmd" >/dev/null; then
      printf "%s %s\n" "$cmd" "command required!"
      err=true
    fi
  done
  if [ $err = true ]; then
    exit 1
  fi
}

install_tmux_tpm() {
  printf "Installing Tmux Plugin Manager...\n"
  git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
}

install_nvim_plug() {
  printf "Installing nvim plug...\n"
  curl -fLo "$HOME/.local/share/nvim/site/autoload/plug.vim" --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

add_dotfiles() {
  printf "Adding dotfiles...\n"
  cp -rT skel "$HOME"
  cp -rT skel-manjaro "$HOME"
  mkdir -p "$HOME/src/theodus"
  mkdir -p "$HOME/src/go"
}

set_compilers() {
  printf "Setting cc, c++, ld ...\n"
  sudo ln -s -f /usr/bin/clang /usr/bin/cc
  sudo ln -s -f /usr/bin/clang++ /usr/bin/c++
  sudo ln -s -f /usr/bin/ld.lld /usr/bin/ld
}

install_fonts() {
  printf "Installing fonts...\n"
  mkdir -p ~/.local/share/fonts
  cp "JetBrains Mono Medium Nerd Font Complete.ttf" ~/.local/share/fonts/
  fc-cache
}

require clang clang-format git go lld lldb nvim rg tmux
install_tmux_tpm
install_nvim_plug
add_dotfiles
set_compilers
install_fonts

echo "nvim: run :PlugInstall"
echo "tmux: run prefix + I"
