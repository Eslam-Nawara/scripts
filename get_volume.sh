#!/bin/bash

info=$(amixer -D pulse get Master | grep "Front Left:" | cut -d ' ' -f 7- | tr -d '[%]')
percentage=$(echo $info | cut -d ' ' -f 1)
state=$(echo $info | cut -d ' ' -f 2)

[[ $percentage -gt 50                       ]] && icon="🔊"
[[ $percentage -gt 0 && $percentage -le 50  ]] && icon="🔉"
[[ $percentage -eq 0                        ]] && icon="🔈"

[[ $state = "on"  ]] && echo "$icon $percentage%"
[[ $state = "off" ]] && echo "🔇 $percentage%"
