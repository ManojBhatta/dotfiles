#!/bin/bash

# Minimum allowed brightness (in percent)
MIN=5

# Get current brightness in percent (integer)
CUR=$(brightnessctl get)
MAX=$(brightnessctl max)
CURP=$(( 100 * CUR / MAX ))

if [ "$1" == "down" ]; then
    # Only decrease if above MIN
    if [ "$CURP" -le "$MIN" ]; then
        exit 0
    fi
    brightnessctl set 5%-
elif [ "$1" == "up" ]; then
    brightnessctl set +5%
fi
