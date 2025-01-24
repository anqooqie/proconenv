#!/bin/bash -eu

if [ "$#" -ne 1 ]; then
  echo 'Usage: '"$0"' problem-url' >&2
  exit 1
fi

cp -r "$(acc config-dir)"/"$(acc config default-template)"/ "$(basename "$1")"
oj download -d "$(basename "$1")"/test "$1"
