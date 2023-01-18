#!/bin/zsh

layout=$(xkb-switch)

[[ $layout = 'us' ]] && echo '🇺🇸'
[[ $layout = 'ara' ]] && echo '🇸🇦'
