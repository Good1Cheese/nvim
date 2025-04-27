#!/usr/bin/env bash

set -o xtrace

exec 10>/home/cheese/.config/nvim/nvim-godot/test.txt
export BASH_XTRACEFD=10

nvr --servername "$HOME"/.cache/nvim/godot-server.pipe --remote-send "<C-\><C-N>:n $1<CR>"
