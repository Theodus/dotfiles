#!/bin/sh

. setup/common.sh

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

install_packages
install_nvidia
add_dotfiles skel
install_tmux_tpm
install_nvim_plug
