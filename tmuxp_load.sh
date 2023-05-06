#!/bin/sh

sessions=$(find ~/.config/tmuxp -type f | awk -F '/' '{print $NF}' | awk -F '.' '{print $1}')
select_session=$(echo "$sessions" | fzf)

[[ -z $select_session ]] && exit 0

tmuxp load $select_session
