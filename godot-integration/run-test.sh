#!/usr/bin/env bash

[ -n "$1" ] && file=$1
foot -e nvim --server ~/.cache/nvim/godot.pipe -c ":e $file"
