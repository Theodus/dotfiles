#!/usr/bin/env fish

function require
  for arg in $argv
    if not command --search --quiet $arg
      printf "%s %s\n" $arg "command required!"
      exit 1
    end
end

function build_src_tree
  echo "Building source tree..."
  mkdir -p $HOME/src/theodus
end

function add_default_dotfiles
  echo "Adding default dotfiles..."

  set -l dotfiles_dir $HOME/src/theodus

  cd $HOME/src/theodus
  git clone https://github.com/theodus/dotfiles
  cd -

  cat $dotfiles_dir/.profile_ext.sh >> $HOME/.profile
  cp -r $dotfiles_dir/.config/* $HOME/.config
end

require git clang clang++
build_src_tree
add_default_dotfiles
echo "TODO setup sublime text:"
echo "https://stackoverflow.com/questions/19529999/add-package-control-in-sublime-text-3-through-the-command-line"
