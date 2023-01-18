#!/bin/sh

layout=$(printf "%s\n" "toggle" "tabbed" "stacking" "splitv" "splith" | dmenu -i -p "container layout:")

i3-msg layout $layout
