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

install_tmux_tpm() {
  printf "Installing Tmux Plugin Manager\n"
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
}

install_nvim_plug() {
  printf "Installing nvim plug...\n"
  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

build_src_tree() {
  printf "Building source tree...\n"
  mkdir -p ~/src/theodus
  mkdir -p ~/src/go
}

build_bin_dir() {
  printf "Adding bin files...\n"
  mkdir -p ~/bin
  cp bin/* ~/bin
}

add_dotfiles() {
  printf "Adding dotfiles...\n"
  cp -r bin .config .gitconfig .profile .tmux.conf .clang-format ~
}

set_compilers() {
  printf "Setting cc, c++, ld ...\n"
  sudo ln -s -f /usr/bin/clang /usr/bin/cc
  sudo ln -s -f /usr/bin/clang++ /usr/bin/c++
  sudo ln -s -f /usr/bin/ld.lld /usr/bin/ld
}

require clang lld lldb clang-format git go nvim
install_tmux_tpm
install_nvim_plug
build_src_tree
build_bin_dir
add_dotfiles
set_compilers

echo "nvim: run :PlugInstall"
echo "tmux: run prefix + i"

