#!/bin/bash

choice=$(printf "%s\n%s\n%s\n%s\n%s\n" "Shutdown" "Restart" "Sleep" "Lock" "Logout" | dmenu -i -p "Power: ")

if [[ $choice = "Sleep" ]]
then
    dm-tool lock
    systemctl suspend
fi

[[ $choice = "Shutdown" ]] && shutdown now
[[ $choice = "Restart" ]] && shutdown -r now
[[ $choice = "Lock" ]] && dm-tool lock
[[ $choice = "Logout" ]] && i3-msg exit
