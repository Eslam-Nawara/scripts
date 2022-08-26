#!/bin/bash

arg=$1

[[ $arg = 'lower' ]] && amixer -D pulse sset Master 5%-
[[ $arg = 'higher' ]] && amixer -D pulse sset Master 5%+
[[ $arg = 'toggle' ]] && amixer -D pulse sset Master toggle

# refresh i3blocks
pkill -SIGRTMIN+10 i3blocks
