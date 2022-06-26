#!/usr/bin/python3
from Xlib import display
import subprocess

d = display.Display()
root = d.screen().root

query = root.query_tree()

for c in query.children:
    # returns window name or None
    name = c.get_wm_name()
    print(name)
    # if name == "Alacritty":
    #     break
    # else:
    #     # subprocess.call("alacritty")
    #     break
