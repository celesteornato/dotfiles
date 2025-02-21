#!/bin/sh

WTHR=$(ansiweather -l Paris -p false -a false -H true)
TIME=$(date)
BAT=$(upower -i /org/freedesktop/UPower/devices/battery_devxbatteryx0  | grep "percentage" | awk '{print $2}')
BATCHARGE=$(upower -i /org/freedesktop/UPower/devices/battery_devxbatteryx0  | grep "state" | awk '{print $2}')

SPACER="            "
BIGSPACER="                                    "

# echo "$WTHR $SPACER $BAT $BATCHARGE $BIGSPACER $TIME"
echo "$TIME $SPACER $BAT $BATCHARGE $BIGSPACER $WTHR"
