#!/bin/bash

INTERNAL_MONITOR="eDP-1"

case "$1" in
  close)
    hyprctl keyword monitor "$INTERNAL_MONITOR,disable" >/dev/null
    notify-send "Hyprland" "Monitor interno desactivado (tapa cerrada)"
    ;;
  open)
    hyprctl keyword monitor "$INTERNAL_MONITOR,preferred,auto,1" >/dev/null
    notify-send "Hyprland" "Monitor interno activado (tapa abierta)"
    ;;
esac

