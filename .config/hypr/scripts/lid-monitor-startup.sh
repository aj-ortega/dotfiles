#!/bin/bash

INTERNAL_MONITOR="eDP-1"

# Leer estado de la tapa
if [ -f /proc/acpi/button/lid/LID*/state ]; then
    LID_STATE=$(cat /proc/acpi/button/lid/LID*/state | awk '{print $2}')
else
    # fallback: asumimos abierta si no existe
    LID_STATE="open"
fi

# Ejecutar según el estado
if [ "$LID_STATE" = "closed" ]; then
    hyprctl keyword monitor "$INTERNAL_MONITOR,disable" >/dev/null
    notify-send "Hyprland" "Monitor interno desactivado (tapa cerrada al inicio)"
else
    hyprctl keyword monitor "$INTERNAL_MONITOR,preferred,auto,1" >/dev/null
    notify-send "Hyprland" "Monitor interno activado (tapa abierta al inicio)"
fi
