#!/bin/sh
cp "$1" ~/.background_img
if [ "$2" != "noreload" ]
then
swaymsg reload
fi

BRIGHTNESS=$(magick ~/.background_img -gravity South -chop 90% -colorspace gray -format "%[fx:round(100*mean)]" info:)

if [ $BRIGHTNESS -gt 40 ]
then
  echo "switching to light bg mode"
  swaymsg 'layer_effects "waybar" blur disable;'
  ln -f ~/.config/waybar/light.css ~/.config/waybar/current.css
else
  echo "switching to dark bg mode"
  swaymsg 'layer_effects "waybar" blur enable;'
  ln -f ~/.config/waybar/dark.css ~/.config/waybar/current.css
fi

pkill waybar -USR2
