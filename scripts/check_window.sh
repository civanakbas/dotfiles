#!/bin/bash
[[ ! "$(wmctrl -l|awk '{$3=""; $2=""; $1=""; print $0}')" =~ "Alacritty" ]] && alacritty
[[ "$(wmctrl -l|awk '{$3=""; $2=""; $1=""; print $0}')" =~ "Alacritty" ]] && wmctrl -a Alacritty
