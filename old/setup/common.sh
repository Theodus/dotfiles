#!/bin/sh

set -u
set -e

require() {
  err=false
  for cmd in "$@"; do
    if ! command -v "${cmd}" >/dev/null; then
      printf "%s %s\n" "${cmd}" "command required!"
      err=true
    fi
  done
  if [ ${err} = true ]; then
    exit 1
  fi
}

install_tmux_tpm() {
  printf "Installing Tmux Plugin Manager...\n"
  git clone https://github.com/tmux-plugins/tpm "${HOME}/.tmux/plugins/tpm"
}

install_nvim_plug() {
  printf "Installing nvim plug...\n"
  curl -fLo "${HOME}/.local/share/nvim/site/autoload/plug.vim" --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

add_dotfiles() {
  printf "Adding dotfiles...\n"
  for dir in "$@"; do
    cp -r "${dir}"/. "${HOME}"
  done
  mkdir -p "${HOME}/src/theodus"
}

set_compilers() {
  printf "Setting cc, c++, ld ...\n"
  sh "${HOME}/bin/toolchain-symlinks.sh"
}

install_fonts() {
  printf "Installing fonts...\n"
  font_dir="${1}"
  mkdir -p "${font_dir}"
  cp "JetBrains Mono Medium Nerd Font Complete.ttf" "${font_dir}"
  if command -v fc-cache; then
    fc-cache
  fi
}

install_tools() {
  printf "Installing rustup...\n"
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
}
