#!/bin/sh

[[ $BLOCK_BUTTON -eq 1 ]] && zenity --calendar >> /dev/null
date '+%a, %d %b'
