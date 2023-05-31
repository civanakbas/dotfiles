#!/bin/bash

# Get the available display names using xrandr
display_names=$(xrandr | grep " connected" | awk '{print $1}')

# Check if there are at least two displays connected
if [[ $(echo "$display_names" | wc -l) -lt 2 ]]; then
  echo "Error: At least two displays are required."
  exit 1
fi

# Check if the script was called with a parameter
if [[ $# -gt 0 ]]; then
  if [[ $1 == "disable" ]]; then
    # Disable the primary monitor if it is currently enabled
    if xrandr --listactivemonitors | grep -q "^\ 1:"; then
      xrandr --output "HDMI-1" --off
      echo "Disabled HDMI-1"
      exit 0
    else
      echo "Error: HDMI-1 is already disabled."
      exit 1
    fi
  fi
fi

# Enable HDMI-1 as the right of eDP-1
xrandr --output "HDMI-1" --auto --right-of "eDP-1" --primary
echo "Enabled HDMI-1 as the right of eDP-1"

exit 0

