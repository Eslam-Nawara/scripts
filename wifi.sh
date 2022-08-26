#!/bin/zsh

network=$(nmcli -t dev wifi | grep '*')
percentage=$(echo $network | cut -d ':' -f 12)
# bar=$(echo $network | cut -d ':' -f 13)

[[ network ]] && echo " $percentage%"
