#!/bin/bash

info=$(amixer -D pulse get Capture | grep "Front Left:" | cut -d ' ' -f 7- | tr -d '[%]')
percentage=$(echo $info | cut -d ' ' -f 1)
state=$(echo $info | cut -d ' ' -f 2)

[[ $state = "on"  ]] && echo "🎤 $percentage%"
[[ $state = "off" ]] && echo " $percentage%"

