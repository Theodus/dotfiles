#!/bin/sh

require() {
  for cmd in "$@"; do
    if ! command -v "$cmd" >/dev/null; then
      printf "%s %s\n" "$cmd" "command required!"
      exit 1
    fi
  done
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
  cp -r .config/* "$HOME/.config"
}

require clang git go terminator
build_src_tree
build_bin_dir
add_dotfiles

