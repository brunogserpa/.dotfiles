#!/bin/sh

current_layout=$(hyprctl getoption general:layout | grep 'str:' | awk '{print $2}')

if [ "$current_layout" = "dwindle" ]; then
    hyprctl keyword general:layout scrolling
else
    hyprctl keyword general:layout dwindle
fi
