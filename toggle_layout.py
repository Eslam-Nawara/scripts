#!/usr/bin/env python3
import i3ipc

i3 = i3ipc.Connection()
ws = i3.get_tree().find_focused().workspace()
layout = ws.descendants()[0].layout
if layout == 'tabbed':
    i3.command('layout default')
else:
    i3.command('layout tabbed')