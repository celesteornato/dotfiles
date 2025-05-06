#!/bin/sh

getmail > /dev/null 2>&1
if [ "$(ls -A ~/Mail/new)" ]; then
  echo "󰶍 You've got Mail."
fi
