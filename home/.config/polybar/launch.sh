#!/bin/sh

killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
~/.config/polybar/config
polybar example &
echo "polybar started"

