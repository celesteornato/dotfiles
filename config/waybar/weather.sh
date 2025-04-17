#!/bin/sh
LOCATION=$(curl -s 'http://ip-api.com/json?fields=city' | jq '.city' | sed 's/.$//' | cut -c 2-)

echo $(~/.config/waybar/ansiweather -l "$LOCATION" -p false -a false -i false -H true)
