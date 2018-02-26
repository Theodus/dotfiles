#!/bin/sh

dotfiles_dir="$HOME/src/theodus/dotfiles"

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
}

build_bin_dir() {
  printf "Adding bin files...\n"
  mkdir -p "$HOME/bin"

  cp "$dotfiles_dir/bin/*" "$HOME/bin"
}

add_default_dotfiles() {
  printf "Adding default dotfiles...\n"
  cd "$HOME/src/theodus" && \
    git clone https://github.com/theodus/dotfiles && \
    cd -


  if [ -f "$HOME/.bashrc" ]; then
    cat "$dotfiles_dir/.profile_ext.sh" >> "$HOME/.bashrc"
  else
    cat "$dotfiles_dir/.profile_ext.sh" >> "$HOME/.profile"
  fi

  cp "$dotfiles_dir/.editorconfig" "$HOME"
  cp -r "$dotfiles_dir"/.config/* "$HOME/.config"
}

setup_sublime() {
  printf "Setting up Sublime Text...\n"
  wget https://packagecontrol.io/Package%20Control.sublime-package
  mv "Package Control.sublime-package" "$HOME/.config/sublime-text-3/Installed Packages"
}

require clang git go subl terminator
build_src_tree
build_bin_dir
add_default_dotfiles
setup_sublime
