#!/bin/sh

mail -e
if [ "$?" -eq "0" ]; then
  echo '󰶍 You have mail.'
else
  echo '󰛮 No mail.'
fi
