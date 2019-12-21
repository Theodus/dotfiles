#!/bin/sh
# Focus windows by direction, works with multihead

# called like this in sxhkdrc:
#super +  {Left,Down,Up,Right}
#   bspwm_focus_move.sh {west,south,north,east} 
    bspc config pointer_follows_monitor true; \
    bspc config pointer_follows_focus true; \
    dir=$@; \
    if ! bspc node -f $dir; then bspc monitor -f $dir; fi; \
    bspc config pointer_follows_monitor false; \
    bspc config pointer_follows_focus false

