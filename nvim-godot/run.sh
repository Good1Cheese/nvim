#!/usr/bin/env bash

set -o xtrace

exec 10> /home/cheese/.config/nvim/nvim-godot/test.txt
export BASH_XTRACEFD=10

# CHANGE IF NEEDED: 
# - replace with your Terminal Emulator executable
term_exec="foot"
# - replace with your Neovim executable
nvim_exec="nvim"
# - replace with other path for the Neovim server pipe
server_path="$HOME/.cache/nvim/godot-server.pipe"

start_server() {
    "$term_exec" -e "$nvim_exec" --listen "$server_path" "$1"
}

open_file_in_server() {
    "$term_exec" -e "$nvim_exec" --server "$server_path" --remote-send "<C-\><C-n>:n $1<CR>:call cursor($2)<CR>"
}

if ! [ -e "$server_path" ]; then
    start_server "$1"
else 
    open_file_in_server "$1" "$2"
fi
