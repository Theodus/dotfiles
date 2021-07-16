#!/bin/sh

. setup/common.sh

require clang clang-format git lld lldb nvim rg tmux
install_tmux_tpm
install_nvim_plug
add_dotfiles skel skel-manjaro
set_compilers
install_fonts ~/.local/share/fonts
install_tools

echo "tmux: run prefix + I"
echo "nvim: run :PlugInstall"
