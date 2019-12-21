. $HOME/.profile

export PS1="\[\e[1;34m\]\u\[\e[1;37m\]|\[\e[1;32m\]\w\[\e[33m\]\$(git-prompt.bash)\[\e[1;37m\]\$\[\e[m\] "

## disable ctrl-s and ctrl-q
stty -ixon

export VISUAL=$EDITOR
export TERMINAL=/usr/bin/alacritty
#export PANEL_FIFO="/tmp/panel-fifo"
#export XDG_CONFIG_HOME="$HOME/.config"
#export BSPWM_SOCKET="/tmp/bspwm-socket"
#export XDG_CONFIG_DIRS=/usr/etc/xdg:/etc/xdg
#export GUI_EDITOR=/usr/bin/micro-st
#export BROWSER=/usr/bin/links-launch
#export QT_QPA_PLATFORMTHEME="qt5ct"
#export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

# bash completion
if ! shopt -oq posix; then
  if [ -r /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -r /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

