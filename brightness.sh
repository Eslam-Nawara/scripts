#!/bin/bash

arg=$1

[ $arg = 'lower' ] && sudo xbacklight -dec 5
[ $arg = 'higher' ] && sudo xbacklight -inc 5

# refresh i3blocks
# pkill -SIGRTMIN+11 i3blocks
