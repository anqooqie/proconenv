#!/bin/bash -eu

if [ ! -d /workspaces/proconenv/lib ]; then
  git clone https://github.com/anqooqie/proconlib.git /workspaces/proconenv/lib
  git -C /workspaces/proconenv/lib submodule update --init --recursive
  git -C /workspaces/proconenv/lib remote set-url origin git@github.com:anqooqie/proconlib.git
fi
ln -s /workspaces/proconenv/lib/template ~/.config/atcoder-cli-nodejs/cpp
ln -s /workspaces/proconenv/lib_py/template ~/.config/atcoder-cli-nodejs/py
