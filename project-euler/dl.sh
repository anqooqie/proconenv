#!/bin/bash -eu

if [ "$#" -ne 1 ]; then
  echo 'Usage: '"$0"' problem-id' >&2
  exit 1
fi

cp -r "$(acc config-dir)"/"$(acc config default-template)"/ "$1"
