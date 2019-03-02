#!/bin/sh

require() {
  local err=false
  for cmd in "$@"; do
    if ! command -v "$cmd" >/dev/null; then
      printf "%s %s\n" "$cmd" "command required!"
      err=true
    fi
  done
  if [ "$err" = true ]; then
    exit 1
  fi
}

install_nvim_plug() {
  printf "Installing nvim plug...\n"
  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

build_src_tree() {
  printf "Building source tree...\n"
  mkdir -p "$HOME/src/theodus"
  mkdir -p "$HOME/src/go"
}

build_bin_dir() {
  printf "Adding bin files...\n"
  mkdir -p "$HOME/bin"
  cp bin/* "$HOME/bin"
}

add_dotfiles() {
  printf "Adding dotfiles...\n"
  cp -r .* "$HOME"
}

require clang git go nvim
install_nvim_plug
build_src_tree
build_bin_dir
add_dotfiles
