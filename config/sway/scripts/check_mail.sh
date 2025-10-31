#!/bin/sh

# getmail is called in a cronjob
if [ "$(ls -A ~/Mail/new)" ]; then
  echo "You have mail"
fi
