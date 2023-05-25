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
    # Disable the secondary monitor if it is currently enabled
    for display in $display_names; do
      if xrandr --listactivemonitors | grep -q "$display"; then
        xrandr --output "$display" --off
        echo "Disabled $display"
        exit 0
      fi
    done
    echo "Error: Secondary monitor is already disabled."
    exit 1
  fi
fi

# Find the first inactive display and enable it as the right of the primary display
primary_display=$(xrandr --listactivemonitors | grep "^\ 0:" | awk '{print $4}')
for display in $display_names; do
  if ! xrandr --listactivemonitors | grep -q "$display"; then
    xrandr --output "$display" --auto --left-of "$primary_display"
    echo "Enabled $display as the left of $primary_display"
    exit 0
  fi
done

echo "Error: Unable to find an inactive display."
exit 1

