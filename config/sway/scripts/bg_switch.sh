#!/bin/sh
cp "$1" ~/.background_img
swaymsg reload &
BRIGHTNESS=$(magick ~/.background_img -gravity South -chop 90% -colorspace gray -format "%[fx:round(100*mean)]" info:)
unlink ~/.config/waybar/current.css
if [ $BRIGHTNESS -gt 20 ];
then
  echo "switching to light bg mode"
  ln -s ~/.config/waybar/light.css ~/.config/waybar/current.css
else
  echo "switching to dark bg mode"
  ln -s ~/.config/waybar/dark.css ~/.config/waybar/current.css
fi
pkill waybar
exec waybar & 
