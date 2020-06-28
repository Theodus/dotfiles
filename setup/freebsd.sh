#!/bin/sh

# TODO: nvidia-driver?

# Enable sudo for wheel group with visudo

install_packages() {
  sudo pkg install \
    zsh tmux git bash \
    xorg xfce lightdm lightdm-gtk-greeter
  sudo sysrc \
    linux_enable=yes \
    dbus_enable=yes hald_enable=yes \
    sound_enable=yes snd_hda_load=yes \
    lightdm_enable=yes
  sudo sysrc -f /boot/loader.conf \
    linux_load=yes
}

install_nvidia() {
  sudo pkg install nvidia-driver
  sudo sysrc kld_list+=nvidia-modeset
  echo \
'Section "Device"
  Identifier "NVIDIA Card"
  VendorName "NVIDIA Corporation"
  Driver "nvidia"
EndSection
' | sudo tee /usr/local/etc/X11/xorg.conf.d/driver-nvidia.conf
}

add_dotfiles() {
  printf "Adding dotfiles...\n"
  cp -rn skel/. $HOME
}

install_tmux_tpm() {
  printf "Installing Tmux Plugin Manager...\n"
  git clone "https://github.com/tmux-plugins/tpm" \
    "$HOME/.tmux/plugins/tpm"
  echo "tmux: \`prefix + I\`"
}

install_nvim_plug() {
  printf "Installing Neovim plug...\n"
  curl -fLo "$HOME/.local/share/nvim/site/autoload/plug.vim" \
    --create-dirs "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  echo "nvim: \`:PlugInstall\`"
}

install_packages
install_nvidia
add_dotfiles
install_tmux_tpm
install_nvim_plug
