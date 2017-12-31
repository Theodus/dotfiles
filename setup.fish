#!/usr/bin/env fish

function require
  for arg in $argv
    if not command --search --quiet "$arg"
      printf "%s %s\n" "$arg" "command required!"
      exit 1
    end
  end
end

function build_src_tree
  echo "Building source tree...\n"
  mkdir -p "$HOME/src/theodus"
end

function add_default_dotfiles
  echo "Adding default dotfiles...\n"

  set -l dotfiles_dir "$HOME/src/theodus/dotfiles"

  cd "$HOME/src/theodus"
  git clone https://github.com/theodus/dotfiles
  cd -

  cat "$dotfiles_dir/.profile_ext.sh" >> "$HOME/.profile"
  cp -r "$dotfiles_dir"/.config/* "$HOME/.config"
end

function setup_sublime
  echo "Setting up Sublime Text...\n"
  wget https://packagecontrol.io/Package%20Control.sublime-package
  mv "Package Control.sublime-package" "$HOME/.config/sublime-text-3/Installed Packages"
end

require git clang clang++
build_src_tree
add_default_dotfiles
setup_sublime

