#!/bin/bash

# Get the names of the monitors
MONITOR1="HDMI-A-2"
MONITOR2="eDP-1"

# Get the current workspace of each monitor
WORKSPACE1=$(hyprctl monitors | grep -A 4 "$MONITOR1" | grep "active workspace" | awk '{print $3}')
WORKSPACE2=$(hyprctl monitors | grep -A 4 "$MONITOR2" | grep "active workspace" | awk '{print $3}')

# Swap the workspaces
hyprctl dispatch workspace "$WORKSPACE2" "$MONITOR1"
hyprctl dispatch workspace "$WORKSPACE1" "$MONITOR2"

# Check the argument and set the target monitor
if [ "$1" == "monitor1" ]; then
    TARGET_MONITOR="$MONITOR1"
elif [ "$1" == "monitor2" ]; then
    TARGET_MONITOR="$MONITOR2"
else
    echo "Invalid argument. Use 'monitor1' or 'monitor2'."
    exit 1
fi

# Print the target monitor
echo "Target monitor: $TARGET_MONITOR"