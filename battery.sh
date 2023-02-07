#!/bin/zsh

state=$(acpi | cut -d ' ' -f 3 | tr -d ',')
percentage=$(acpi | cut -d ' ' -f 4 | tr -d '%,')

if [[ $percentage = "charging" ]]
then
    percentage=$(acpi | cut -d ' ' -f 5 | tr -d '%,')
fi

if [[ $state = "Discharging" ]]
then
    [[ $percentage -ge 90 ]] && icon="🔋"
    [[ $percentage -ge 70 && $percentage -lt 90 ]] && icon="🔋"
    [[ $percentage -ge 40 && $percentage -lt 70 ]] && icon="🪫"
    [[ $percentage -ge 20 && $percentage -lt 40 ]] && icon="🪫"
    if [[ $percentage -le 15 ]]
    then
        dm-tool lock
        systemctl suspend
    fi
    echo "$icon $percentage%"


else
    echo "🔌 $percentage%"
fi
