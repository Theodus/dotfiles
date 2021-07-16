#!/bin/sh

. setup/common.sh

require clang-format git nvim rg tmux
# install_tmux_tpm
# install_nvim_plug
add_dotfiles skel
install_fonts ~/Library/Fonts
# install_tools

echo "tmux: run prefix + I"
echo "nvim: run :PlugInstall"
