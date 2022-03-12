#!/usr/bin/python

# Simple python script to check for if Alacritty is running.
# I use this script to shortcut opening my terminal.

import gi
gi.require_version('Wnck', '3.0')
from gi.repository import GdkX11, Gdk, Wnck
import subprocess   

screen = Wnck.Screen.get_default()
screen.force_update()  # recommended per Wnck documentation

# loop all windows
for window in screen.get_windows():
    window_name = window.get_name()
    if window_name == "Alacritty":
        now = GdkX11.x11_get_server_time(Gdk.get_default_root_window())
        window.activate(now)
        break
    continue
else:
    subprocess.call("alacritty")

    # clean up Wnck (saves resources, check documentation)
window = None
screen = None
Wnck.shutdown()
