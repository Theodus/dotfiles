#!/bin/sh

## clang
export CC="clang"
export CXX="clang++"
## go
export CGO_LDFLAGS=-fuse-ld=gold
## idris2
export PATH="$HOME/.idris2/bin:$PATH"
## js
export PATH="$HOME/.yarn/bin:$PATH"
## ocaml
if hash opam 2>/dev/null; then eval $(opam env); fi
## pony
export PATH="$HOME/.local/share/ponyup/bin:$PATH"
## rust
. "$HOME/.cargo/env"

export EDITOR=nvim
export SHELL=/usr/bin/zsh
export TERMINAL_COMMAND=/usr/share/sway/scripts/foot.sh

export ZEIT_DB=~/.config/zeit.db

export MOZ_ENABLE_WAYLAND=1
export MOZ_DBUS_REMOTE=1
export GTK_CSD=0

export QT_QPA_PLATFORM=wayland
export QT_QPA_PLATFORMTHEME=qt5ct
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1

#Java XWayland blank screens fix
export _JAVA_AWT_WM_NONREPARENTING=1

export $(gnome-keyring-daemon --start)
